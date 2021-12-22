PROGRAM vie;

uses Crt;

TYPE
	T_POINT_X		= ARRAY OF Char;
	T_UPDATE		= ARRAY OF Integer;
CONST
	EMPTY			= '.';
	CELLULE			= 'A';
	NEW				= 'N';
	NEW_LINE		= 1;
	MAX_ROUND		= 150;
	SPACE			= 3;
	TIME_OUT		= 75;
VAR
	Points			: ARRAY OF T_POINT_X;
	LastConfig		: ARRAY OF T_POINT_X;
	Die				: ARRAY OF T_UPDATE;
	Born			: ARRAY OF T_UPDATE;
	X				: Integer;
	Y				: Integer;
	IsEquals		: Integer;
	Width			: Integer;
	Height			: Integer;
	Map				: Text;
	CheckMap		: Text;
	Line			: String;
	LineNumber		: Integer;
	CelluleCounter	: Integer;
	NewLine			: Integer;
	Round			: Integer;
	CheckCelluleX	: Integer;
	CheckCelluleY	: Integer;
	CheckX			: Integer;
	CheckY			: Integer;
	CelluleArround	: Integer;
BEGIN
	Assign	(CheckMap, 'map.txt');
	Reset	(CheckMap);

	Width := 0;
	LineNumber := 0;
	WHILE NOT Eof(CheckMap) DO
	BEGIN
		ReadLn(CheckMap, Line);
		IF Width = 0 THEN
			Width := Length(Line)
		ELSE
			IF (Width <> Length(Line)) THEN
			BEGIN
				WriteLn('La ligne numéro ', (LineNumber + 1) , ' n"est pas de la bonne taille (Taille requise: ', Width, ')');
				exit;
			END;
		LineNumber += 1;
	END;
	Close(CheckMap);

	Height := LineNumber - 1;
	SetLength(Points, Height);
	SetLength(LastConfig, Height);
	SetLength(Die, Height);
	SetLength(Born, Height);
	FOR Y := 0 TO Height DO
	BEGIN
		SetLength(Points[Y], Width);
		SetLength(LastConfig[Y], Width);
		SetLength(Die[Y], Width);
		SetLength(Born[Y], Width);
	END;
	X := 0;
	Y := 0;
	CelluleCounter := 0;
	Assign	(Map, 'map.txt');
	Reset	(Map);
	WHILE NOT Eof(Map) DO
	BEGIN
		ReadLn(Map, Line);
		FOR X := 0 TO Length(Line) DO
		BEGIN
			Points[Y, X] := Line[X];
			IF (Points[Y, X] = CELLULE) OR (Points[Y, X] = NEW) THEN
				CelluleCounter += 1;
		END;
		Y += 1;
	END;
	Close(Map);
	IF CelluleCounter < 2 THEN
	BEGIN
		WriteLn('Cette configuration est impossible (minimum 3 cellule sont requise)');
		exit;
	END;

	Round := 0;
	WHILE (Round < MAX_ROUND) AND (CelluleCounter > 0) DO
	BEGIN
		IF (Round > 1) THEN
		BEGIN
			IsEquals := 1;
			FOR Y := 0 TO Height DO
			BEGIN
				FOR X := 0 TO Width DO
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
		FOR Y := 0 TO Height DO
		BEGIN
			FOR X := 0 TO Width DO
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
								CheckY := Height
							ELSE IF CheckY > Height THEN
								CheckY := 0;
							CheckX := X + (CheckCelluleX - SPACE + 1);
							IF CheckX < 0 THEN
								CheckX := Width
							ELSE IF CheckX > Width THEN
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
		FOR Y := 0 TO Height DO
		BEGIN
			FOR X := 0 TO Width DO
			BEGIN
				IF (Die[Y, X] = 1) THEN
				BEGIN
					Points[Y, X] := EMPTY;
					Die[Y, X] := 0;
				END;
			END;
		END;
		FOR Y := 0 TO Height DO
		BEGIN
			FOR X := 0 TO Width DO
			BEGIN
				IF (Born[Y, X] = 1) THEN
				BEGIN
					Points[Y, X] := NEW;
					Born[Y, X] := 0;
				END;
			END;
		END;
		Delay(TIME_OUT);
		FOR NewLine := 0 TO NEW_LINE DO
			WriteLn('');
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
