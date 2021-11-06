// Nom du programme
program ex2;

// Déclaration des variables
var
		// Création d'un variable de type integer (entier) du nom de nombre afin de récupérer le nombre saisit par l'utilisateur
        nombre: integer;

// Début du programme
begin
		// Demande de la saisie d'un utilisateur
        write('Veuillez saisir un nombre: ');

		// Récupération du nombre
        readln(nombre);

		// Analyse pour savoir si le nombre est à la fois différent de 6,9 et 12
		// Si oui
        if (nombre <> 6) and (nombre <> 9) and (nombre <> 12) THEN
			// Afficher KO avec un retour à la ligne
            writeln('KO')
		// Si non
		else
			// Afficher OK avec un retour à la ligne
			writeln('OK');
		// Fin du test
		end.

// Fin du programme
end.
