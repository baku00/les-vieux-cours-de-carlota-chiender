program ex2;
var
        nombre: integer;
begin
        write('Veuillez saisir un nombre: ');
        readln(nombre);
        if (nombre = 6) or (nombre = 9) or (nombre = 12) THEN
            writeln('OK')
		else
			writeln('KO');
		end.
end
