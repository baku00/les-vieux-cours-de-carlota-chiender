PROGRAM vie;
uses Crt, sysutils;

TYPE
	T_POINT_X			= ARRAY OF Char;
	T_UPDATE			= ARRAY OF Integer;
CONST
	EMPTY				= '.';
	CELLULE				= 'A';
	NEW					= 'N';
	NEW_LINE			= 1;
	MAX_ROUND			= 150;
	SPACE				= 3;
	TIME_OUT			= 75;
	WIDTH				= 19;
	HEIGHT				= 19;
	LOAD_CONFIG			= '1';
	MANUAL_INPUT		= '2';
	EOI					= '-1';
	NEXT				= '1';
	SAVE				= '2';
	AUTO				= 'A';
	MANUAL				= 'M';
	DEFAULT_FILE_NAME	= 'M';
	EMPTY_FILE_NAME		= '';
VAR
	Points				: ARRAY [0..HEIGHT, 0..WIDTH] OF Char;
	LastConfig			: ARRAY [0..HEIGHT, 0..WIDTH] OF Char;
	Die					: ARRAY [0..HEIGHT, 0..WIDTH] OF Integer;
	Born				: ARRAY [0..HEIGHT, 0..WIDTH] OF Integer;
	Filename			: String;
	X					: Integer;
	PosX				: Integer;
	Y					: Integer;
	PosY				: Integer;
	IsEquals			: Integer;
	Map					: Text;
	Line				: String;
	CelluleCounter		: Integer;
	NewLine				: Integer;
	Round				: Integer;
	CheckCelluleX		: Integer;
	CheckCelluleY		: Integer;
	CheckX				: Integer;
	CheckY				: Integer;
	CelluleArround		: Integer;
	Choice				: String;
	Action				: String;
	Style				: String;
BEGIN
	CelluleCounter := 0;
	FOR Y := 0 TO HEIGHT DO
		FOR X := 0 TO WIDTH DO
			Points[Y, X] := EMPTY;

	Style := '0';
	WHILE (Style <> AUTO) AND (Style <> MANUAL) DO
	BEGIN
		Writeln(AUTO, '. Mise à jour automatique (Avec limite de tour), ', MANUAL, '. Mise à jour manuel');
		Write('Votre choix: ');
		ReadLn(Style);
	END;
	Choice := '0';
	WHILE (Choice <> LOAD_CONFIG) AND (Choice <> MANUAL_INPUT) DO
	BEGIN
		Writeln(LOAD_CONFIG, '. Charger une configuration, ', MANUAL_INPUT, '. Saisie manuelle');
		Write('Votre choix: ');
		ReadLn(Choice);
	END;
	Filename := DEFAULT_FILE_NAME;
	IF (Choice = LOAD_CONFIG) THEN
	BEGIN
		Write('Configuration à charger: ');
		ReadLn(Filename);
		Assign	(Map, Filename);
		Reset	(Map);
		WHILE NOT Eof(Map) DO
		BEGIN
			ReadLn(Map, Line);
			PosY := Pos(',', Line) - 1;
			PosX := PosY + 2;
			Y := StrToInt(Copy(Line, 1, PosY));
			X := StrToInt(Copy(Line, PosX, Length(Line)));
			Points[Y, X] := CELLULE;
			CelluleCounter += 1;
		END;
		Close(Map);
	END
	ELSE IF (Choice = MANUAL_INPUT) THEN
	BEGIN
		REPEAT
			Write('Point (Y,X): ');
			ReadLn(Line);
			IF (Line <> EOI) THEN
			BEGIN
				PosY := Pos(',', Line) - 1;
				PosX := PosY + 2;
				Y := StrToInt(Copy(Line, 1, PosY));
				X := StrToInt(Copy(Line, PosX, Length(Line)));
				Points[Y, X] := CELLULE;
				CelluleCounter += 1;
			END;
		UNTIL (Line = EOI);
	END;

	Round := 0;
	Action := '';
	WHILE (Action = NEXT) OR ((Style = AUTO) AND (Round < MAX_ROUND) AND (CelluleCounter > 0)) DO
	BEGIN
		IF (Round > 1) THEN
		BEGIN
			IsEquals := 1;
			FOR Y := 0 TO HEIGHT DO
			BEGIN
				FOR X := 0 TO WIDTH DO
				BEGIN
					IF (Points[Y, X] <> LastConfig[Y, X]) THEN
						IsEquals := 0;
				END;
			END;
			IF (IsEquals = 1) THEN
			BEGIN
				WriteLn();
				WriteLn('Cette configuration sarrete ici');
				exit;
			END;
		END;
		Round += 1;
		CelluleCounter := 0;
		FOR Y := 0 TO HEIGHT DO
		BEGIN
			FOR X := 0 TO WIDTH DO
			BEGIN
				Write(Points[Y,X]);
				LastConfig[Y, X] := Points[Y, X];
				IF (Points[Y, X] = CELLULE) OR (Points[Y, X] = NEW) THEN
					CelluleCounter += 1;
				IF 1 = 1 THEN BEGIN
					CelluleArround := 0;
					FOR CheckCelluleY := 1 TO SPACE DO
					BEGIN
						FOR CheckCelluleX := 1 TO SPACE DO
						BEGIN
							CheckY := Y + (CheckCelluleY - SPACE + 1);
							IF CheckY < 0 THEN
								CheckY := HEIGHT
							ELSE IF CheckY > HEIGHT THEN
								CheckY := 0;
							CheckX := X + (CheckCelluleX - SPACE + 1);
							IF CheckX < 0 THEN
								CheckX := WIDTH
							ELSE IF CheckX > WIDTH THEN
								CheckX := 0;
							IF (Points[CheckY, CheckX] = CELLULE) OR (Points[CheckY, CheckX] = NEW) THEN
							BEGIN
								IF ((CheckY = Y) and (CheckX = X)) THEN
								BEGIN

								END
								ELSE
									CelluleArround += 1;
							END;
						END;
					END;
					IF (CelluleArround < 2) THEN
					BEGIN
						Die[Y, X] := 1;
					END
					ELSE IF CelluleArround > 3 THEN
					BEGIN
						Die[Y, X] := 1;
					END
					ELSE IF CelluleArround = 3 THEN
					BEGIN
						Born[Y, X] := 1;
					END;
				END;
			END;
			WriteLn('');
		END;
		FOR Y := 0 TO HEIGHT DO
		BEGIN
			FOR X := 0 TO WIDTH DO
			BEGIN
				IF (Die[Y, X] = 1) THEN
				BEGIN
					Points[Y, X] := EMPTY;
					Die[Y, X] := 0;
				END;
			END;
		END;
		FOR Y := 0 TO HEIGHT DO
		BEGIN
			FOR X := 0 TO WIDTH DO
			BEGIN
				IF (Born[Y, X] = 1) THEN
				BEGIN
					Points[Y, X] := NEW;
					Born[Y, X] := 0;
				END;
			END;
		END;
		IF (STYLE = AUTO) THEN
			Delay(TIME_OUT)
		ELSE BEGIN
			Action := '0';
			WHILE (Action <> NEXT) AND (Action <> SAVE) DO BEGIN
				Write('Continuer (', NEXT, '), Sauver et quitter (', SAVE, '): ');
				ReadLn(Action);
			END;
		END;
		FOR NewLine := 0 TO NEW_LINE DO
			WriteLn('');
	END;
	IF (Action = SAVE) THEN
	BEGIN
		WHILE (Filename = DEFAULT_FILE_NAME) OR (Filename = EMPTY_FILE_NAME) DO
		BEGIN
			Write('Nom du fichier dans lequel saisir les valeurs: ');
			ReadLn(Filename);
		END;
		Assign(Map, Filename);
		Reset(Map);
		FOR Y := 0 TO HEIGHT DO
			FOR X := 0 TO WIDTH DO
				IF (Points[Y, X] = CELLULE) OR (Points[Y, X] = NEW) THEN
				BEGIN
					Line := IntToStr(Y);
					Line += ',';
					Line += IntToStr(X);
					Line += #10;
					WriteLn(Map, Line);
				END;
		Close(Map);
	END;
	IF (CelluleCounter > 0) THEN
	BEGIN
		WriteLn();
		WriteLn('Le nombre de tour limite a été atteint (', MAX_ROUND, ')');
		WriteLn('Vous pouvez changer la valeur de MAX_ROUND pour ajuster le nombre de tour maximum');
	END
	ELSE BEGIN
		WriteLn();
		WriteLn('Toutes les cellules sont mortes');
	END;
END.
