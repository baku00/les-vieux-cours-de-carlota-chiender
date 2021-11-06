// Nom du programme
program ex3;

// Déclaration des variables
var
	// n sera le nombre saisit par l'utilisateur
	n: integer;

	// nbr sera le résultat de la factoriel de n
	nbr: integer;

	// Sera le compteur permettant de calculer la factoriel de n
	i: integer;

// Début du programme
begin

	// Initialisation de la variable nbr à 1 afin de pouvoir  la multiplier par la suite (Multiplication par 0 = 0)
	nbr := 1;

	// Début d'une boucle repeat / until pour la saisie utilisateur
	repeat
		// Demande de la saisie utilisateur
		write('(', n , ') Saisissez un nombre supérieur à 0: ');
		// Récupération du nombre saisit par l'utilisateur
		readln(n);

	// Si n est inférieur ou égal à 0, la boucle recommence
	until n > 0;

	// Début d'une boucle for aller de 1 à n
	for i:=1 to n do
		// Multiplication de nbr par i
		nbr *= i;

	// Affiche du résultat factoriel de n
	writeln('Factoriel: ', nbr);

// Fin du programme
end.
