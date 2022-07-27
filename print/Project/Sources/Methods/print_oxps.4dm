//%attributes = {"invisible":true,"preemptive":"incapable"}
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