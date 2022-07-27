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
