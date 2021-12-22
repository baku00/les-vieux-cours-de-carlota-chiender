PROGRAM vie;

uses Crt;

TYPE
	POINT_X			= ARRAY OF Char;
	UPDATE			= ARRAY OF Integer;
CONST
	EMPTY			= 'O';
	CELLULE			= 'X';
	NEW_LINE		= 5;
	MAX_ROUND		= 2;
	SPACE			= 3;
VAR
	Points			: ARRAY OF POINT_X;
	Die				: ARRAY OF UPDATE;
	Born			: ARRAY OF UPDATE;
	X				: Integer;
	Y				: Integer;
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
	SetLength(Die, Height);
	SetLength(Born, Height);
	FOR Y := 0 TO Height DO
	BEGIN
		SetLength(Points[Y], Width);
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
			IF Points[Y, X] = CELLULE THEN
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

	FOR Round := 0 TO MAX_ROUND DO
	BEGIN
		FOR Y := 0 TO Height DO
		BEGIN
			FOR X := 0 TO Width DO
			BEGIN
				Write(Points[Y,X]);
				IF 1 = 1 THEN BEGIN
					CelluleArround := 0;
					FOR CheckCelluleX := 1 TO SPACE DO
					BEGIN








						FOR CheckCelluleY := 1 TO SPACE DO
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
							IF (Points[CheckY, CheckX] = CELLULE) THEN
							BEGIN
								IF ((CheckCelluleY = Y) and (CheckCelluleX = X)) THEN
									CONTINUE;
								CelluleArround += 1;
							END;
						END;



















					END;
					IF (CelluleArround < 2) THEN
					BEGIN
						Die[Y, X] := 1;
						{-- IF Round > 0 THEN BEGIN
							WriteLn();
							WriteLn('DIE TO Y: ', Y, ';X: ', X);
						END; --}
					END
					ELSE IF CelluleArround > 3 THEN
					BEGIN
						Die[Y, X] := 1;
						{-- IF Round > 0 THEN BEGIN
							WriteLn();
							WriteLn('DIE TO Y: ', Y, ';X: ', X);
						END; --}
					END
					ELSE IF CelluleArround = 3 THEN
					BEGIN
						Born[Y, X] := 1;
						{-- IF Round > 0 THEN BEGIN
							WriteLn();
							WriteLn('BORN TO Y: ', Y, ';X: ', X);
						END; --}
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
					{-- Write('Die To Points[', Y, ', ', X,']'); --}
				END;
			END;
		END;
		FOR Y := 0 TO Height DO
		BEGIN
			FOR X := 0 TO Width DO
			BEGIN
				IF (Born[Y, X] = 1) THEN
				BEGIN
					Points[Y, X] := CELLULE;
					Born[Y, X] := 0;
					{-- Write('Born To Points[', Y, ', ', X,']'); --}
				END;
			END;
		END;
		Delay(250);
		FOR NewLine := 0 TO NEW_LINE DO
			WriteLn('');
		WriteLn('CelluleArround: ', CelluleArround);
	END;
END.
