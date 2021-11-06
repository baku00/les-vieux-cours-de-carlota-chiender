program ex6;
CONST
	CvitesseEAU = 1.2;
	CvitesseSABLE = 2.6;
VAR
	RS: DOUBLE;
	SB: DOUBLE;
	RB: DOUBLE;
	DR: DOUBLE;
	tempsEAU: DOUBLE;
	tempsSABLE: DOUBLE;
	tempsTOTAL: DOUBLE;
	tempsRAPIDE: DOUBLE;
	resultat: DOUBLE;
BEGIN
	tempsRAPIDE := 100000;
	Write('Distance entre la rive et le sauveteur: ');
	ReadLn(RS);
	Write('Distance entre le sauveteur et le baigneur: ');
	ReadLn(SB);
	Write('Distance entre la rive et le baigneur: ');
	ReadLn(RB);
	WriteLn('');
	DR := 0;
	WHILE DR < SB DO BEGIN
		tempsEAU := Sqrt(Sqr(DR) + Sqr(RS)) / CvitesseEAU;
		tempsSABLE := Sqrt(Sqr(SB - DR) + Sqr(RS)) / CvitesseSABLE;
		tempsTOTAL := tempsEAU + tempsSABLE;

		if (tempsTOTAL < tempsRAPIDE) then
		BEGIN
			tempsRAPIDE := tempsTOTAL;
			resultat := DR;
		END;
		DR += 1;
	END;

	WriteLn('==================');
	WriteLn('La distance avec le temps le plus rapide ayant été trouvé sont:');
	WriteLn('Distance: ', resultat:3:2);
	WriteLn('Temps: ', tempsRAPIDE:3:2);
END.
