program ex5;
CONST
	TAILLE_TABLEAU = 50;
var
	nombres: ARRAY[0..TAILLE_TABLEAU] OF INTEGER;
	nombre_premier: INTEGER;
	nombre: INTEGER;
	i: INTEGER;
begin
	nombre := 2;
	nombres[0] := 2;
	nombre_premier := 1;
	WHILE nombre_premier < TAILLE_TABLEAU DO BEGIN
		i := 3;
		WHILE i < nombre DO BEGIN
			if (nombre mod i = 0) then
				Break;
			i += 2;
		END;
		if (i = nombre) then
		BEGIN
			nombres[nombre_premier] := nombre;
			nombre_premier += 1;
		END;
		nombre += 1;
	END;
	FOR i := 0 TO TAILLE_TABLEAU - 1 DO BEGIN
		WriteLn('Nombre n°', i, ': ', nombres[i]);
	END;
end.
