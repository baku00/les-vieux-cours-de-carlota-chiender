PROGRAM ex1 ;
PROCEDURE procB (w:Integer;x:Integer);
	VAR
		k:Integer;
	BEGIN
		k := w + 20;
		k := k * k;
		Writeln(k + 3 - x);
	END;
PROCEDURE procA(z:Integer);
	CONST
		b = 15;
		h = 10;
	VAR
		j:Integer;
	BEGIN
		FOR j := 1 TO 5 DO
			procB(h + j, h) ;
			Writeln(z / 5)
	END;
VAR
	i:Integer ;
BEGIN
	i := 20;
	procA(i);
END.i
