program ex2;
var
        nombre: integer;
begin
        write('Veuillez saisir un nombre: ');
        readln(nombre);
        if (nombre <> 6) and (nombre <> 9) and (nombre <> 12) THEN
            writeln('KO')
		else
			writeln('OK');
		end.
end
