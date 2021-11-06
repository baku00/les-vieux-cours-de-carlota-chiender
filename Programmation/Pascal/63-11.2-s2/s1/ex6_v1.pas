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
BEGIN
	Write('Distance entre la rive et le sauveteur: ');
	ReadLn(RS);
	Write('Distance entre le sauveteur et le baigneur: ');
	ReadLn(SB);
	Write('Distance entre la rive et le baigneur: ');
	ReadLn(RB);
	WriteLn('');
	DR := 0;
	WriteLn('Les différents temps possible pour une distance compris entre ', DR, ' et ', SB, ' sont:');
	WHILE DR < SB DO BEGIN
		WriteLn('==========================');
		WriteLn('Distance de: ', DR);
		tempsEAU := Sqrt(Sqr(DR) + Sqr(RS)) / CvitesseEAU;
		tempsSABLE := Sqrt(Sqr(SB - DR) + Sqr(RS)) / CvitesseSABLE;
		tempsTOTAL := tempsEAU + tempsSABLE;
		WriteLn('Temps eau: ', tempsEAU);
		WriteLn('Temps sable: ', tempsEAU);
		WriteLn('Temps total: ', tempsTOTAL);
		WriteLn('==========================');
		WriteLn('');
		WriteLn('');
		WriteLn('');
		DR += 1;
	END;
END.
