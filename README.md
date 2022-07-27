![version](https://img.shields.io/badge/version-19%2B-5682DF)

# 4d-tips-print-preview
SET PRINT PREVIEWを使用せずにプリントプレビュー（XPS, OXPS, PDF）を出力するには

```4d
SET PRINT PREVIEW:C364(True:C214)
PRINT SETTINGS:C106
If (OK=1)
	If (Is in print preview:C1198)
		
		$options:=get_print_options
		
		$path:=set_print_preview("テスト.oxps")
		
		print_form
		
		set_print_options($options)
		
		OPEN URL:C673($path)
		
	End if 
End if 
```
