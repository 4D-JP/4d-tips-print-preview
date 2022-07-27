//%attributes = {"invisible":true,"preemptive":"incapable"}
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