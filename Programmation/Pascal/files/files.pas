PROGRAM litfichier;
VAR
	fLec		: Text;
	LigneLue	: String;
	PosAvant	: Integer;
	PosApres	: Integer;
	Position	: Integer;
BEGIN
	Assign(fLec, 'test.txt');
	Reset(fLec);
	WHILE NOT Eof(fLec) DO
	BEGIN
		ReadLn(fLec, LigneLue);
		WriteLn(LigneLue);
		PosAvant := Pos(',', LigneLue) - 1;
		PosApres := PosAvant + 2;
		WriteLn('Avant: Position = ', PosAvant, '; Valeur = ', Copy(LigneLue, 1, PosAvant));
		WriteLn('Apres: Position = ', PosApres, '; Valeur = ', Copy(LigneLue, PosApres, Length(LigneLue)));
		WriteLn('');
	END;
	Close(fLec);
END.
