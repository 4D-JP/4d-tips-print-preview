//%attributes = {"invisible":true,"preemptive":"incapable"}
/*
同時に複数のプロセスで印刷コマンドを実行することはできないのでセマフォで制御する
*/

If (Not:C34(Semaphore:C143("印刷"; 60*3)))
	OPEN PRINTING JOB:C995
	$h:=Print form:C5("TEST")
	CLOSE PRINTING JOB:C996
	CLEAR SEMAPHORE:C144("印刷")
End if 