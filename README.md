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

* 自前でプレビューを作成するので`SET PRINT PREVIEW`は`False`に設定します。

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

