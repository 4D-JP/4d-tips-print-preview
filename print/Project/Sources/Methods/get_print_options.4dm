//%attributes = {"invisible":true,"preemptive":"incapable"}
#DECLARE()->$options : Object

$options:=New object:C1471(\
"printView"; Get print preview:C1197; \
"currentPrinter"; Get current printer:C788)

GET PRINTABLE MARGIN:C711($left; $top; $right; $bottom)
$options.marginLeft:=$left
$options.marginTop:=$top
$options.marginRight:=$right
$options.marginBottom:=$bottom