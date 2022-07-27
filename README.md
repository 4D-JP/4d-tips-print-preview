![version](https://img.shields.io/badge/version-19%2B-5682DF)

# 4d-tips-print-preview
SET PRINT PREVIEWを使用せずにプリントプレビュー（XPS, OXPS, PDF）を出力するには

```4d
$options:=get_print_options
$path:=set_print_preview("テスト.oxps")	
print_form
set_print_options($options)		
OPEN URL:C673($path)
```

*get_print_options*

* ドキュメントを出力する場合，印刷マージンは`0`にセットしますが，後で復元できるよう，現在の値を取って置きます。

```4d
#DECLARE()->$options : Object

$options:=New object:C1471(\
"printView"; Get print preview:C1197; \
"currentPrinter"; Get current printer:C788)

GET PRINTABLE MARGIN:C711($left; $top; $right; $bottom)
$options.marginLeft:=$left
$options.marginTop:=$top
$options.marginRight:=$right
$options.marginBottom:=$bottom
```

*set_print_preview*

* カレントプリンターはファイル形式に合わせてXPSドライバーまたはPDFドライバーに設定します。
* `Destination option`は，macOS/PDF Creator 1.7.3であれば`3`，Windows標準ドライバーであれば`2`です。
* 自前でプレビューを作成するので`SET PRINT PREVIEW`は`False`に設定します。

```4d
#DECLARE($name : Text)->$path : Text

$folder:=Folder:C1567(Temporary folder:C486; fk platform path:K87:2).folder(Generate UUID:C1066)
$folder.create()

SET PRINT PREVIEW:C364(False:C215)
SET PRINTABLE MARGIN:C710(0; 0; 0; 0)

$file:=Path to object:C1547($name)

Case of 
	: (($file.extension=".xps") | ($file.extension=".oxps")) & (Is Windows:C1573)
		SET CURRENT PRINTER:C787("Microsoft XPS Document Writer")
	Else 
		SET CURRENT PRINTER:C787(Generic PDF driver:K47:15)
End case 

$path:=$folder.file($file.name+$file.extension).platformPath

Case of 
	: ($file.extension=".pdf") & (Is macOS:C1572)
		SET PRINT OPTION:C733(Destination option:K47:7; 3; $path)
	Else 
		SET PRINT OPTION:C733(Destination option:K47:7; 2; $path)
End case 
```

*print_form*

* 同時に複数のプロセスで印刷コマンドを実行することはできないのでセマフォで制御します。

```4d
If (Not:C34(Semaphore:C143("印刷"; 60*3)))
	OPEN PRINTING JOB:C995
	$h:=Print form:C5("TEST")
	CLOSE PRINTING JOB:C996
	CLEAR SEMAPHORE:C144("印刷")
End if 
```

*set_print_options*

* 印刷マージン等を復元します。

```4d
#DECLARE($options : Object)

SET PRINT PREVIEW:C364($options.printView)
SET CURRENT PRINTER:C787($options.currentPrinter)
SET PRINTABLE MARGIN:C710($options.marginLeft; $options.marginTop; $options.marginRight; $options.marginBottom)
```
