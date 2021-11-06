// Nom du programme
program ex4;

// Déclaration des variables
var
	// Première colonne de type integer (Pas besoin de mettre des ',' à des numéros de colonnes)
	col1: integer;
	// Deuxième colonne
	col2: integer;
	// Troisième colonne
	col3: integer;

	// Colonne saisie par l'utilisateur
	col: integer;

// Début du programme
begin

	// Initialisation d'un générateur de nombre aléatoire
	randomize;

	// Chaque colonne est initialiser avec un nombre aléatoire entre 0 et 4 puis ajout de 1 afin d'obtenir un nombre entre 1 et 5
	col1 := random(5) + 1;
	col2 := random(5) + 1;
	col3 := random(5) + 1;

	// Affichage des colonnes suivit d'un retour à la ligne
	writeln(col1, ' ', col2, ' ', col3);

	// Tant que les colonnes ne sont pas toutes égales
	// (3 <> 5) or (5 <> 3) or (3 <> 3)
	while (col1 <> col2) or (col2 <> col3) or (col1 <> col3) do

	// Début
	begin
		// Demande de saisie de la colonne
		write('Numéro de la colonne: ');

		// Récupération de la saisie dans col
		readln(col);

		// Si col est égal à 1 ou inférieur à 1 ou supérieur à 3
		if (col = 1) or (col < 1) or (col > 3) then
			// Tirage d'un nouveau nombre aléatoire pour la colonne 1
			col1 := random(5) + 1;

		if (col = 2) or (col < 1) or (col > 3) then
			col2 := random(5) + 1;
		if (col = 3) or (col < 1) or (col > 3) then
			col3 := random(5) + 1;

		// Affichage des colonnes suivi d'un retour à la ligne
		writeln(col1, ' ', col2, ' ', col3);

	// Fin de la boucle
	end;

// Fin du programme
end.
