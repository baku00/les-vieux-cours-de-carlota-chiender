PROGRAM ex6;
CONST
	TAILLE_TABLEAU = 10;
	VALEUR_MAX = 100;
VAR
	tab1: ARRAY[0..TAILLE_TABLEAU] OF INTEGER;
	tab2: ARRAY[0..TAILLE_TABLEAU] OF INTEGER;
	i: INTEGER;
BEGIN
	Randomize;
	for i := 0 to TAILLE_TABLEAU do
		tab1[i] := Random(VALEUR_MAX + 1);
	for i := 0 to TAILLE_TABLEAU do
		tab2[i] := Random(VALEUR_MAX + 1);
	WriteLn('      ----------------------------------------------');
	Write('tab 1     | ');
	for i := 0 to TAILLE_TABLEAU do
		Write(tab1[i], ' |');
	WriteLn('');
	WriteLn('----------------------------------------------------');
	Write('tab 2     | ');
	for i := 0 to TAILLE_TABLEAU do
		Write(tab2[i], ' |');
	WriteLn('');
	WriteLn('---------------------------------------------------');
	Write('tabFusion | ');
	for i := 0 to TAILLE_TABLEAU do
		Write(tab1[i] + tab2[i], ' |');
END.
