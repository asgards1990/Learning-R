#�Vous�savez�maintenant��quoi�sert�cette�ligne,�n'oubliez�pas�de�l'adapter�=)
setwd("/Users/sya/Desktop/learning-R")

#�On�d�finit�un�nombre�de�d�part
nombre_depart�<-�0

#�Et�on�y�applique�diff�rentes�op�rations.�Vous�devez�normalement�toutes�les�connaitre
print("Traitement")
resultat�<-�nombre_depart�+�10
resultat�<-�cos(sin(resultat))
resultat�<-�resultat�^�resultat
resultat�<-�log2(resultat)
resultat�<-�sqrt(((resultat�*�10)�/�(resultat�+�5))�*�-5)

#�On�a�fini�nos�diff�rents�traitements�et�on�enregistre�le�r�sultat�dans�un�fichier�externe
print("Sauvegarde")
save(resultat,�file="donnees/resultat.RData")
print("Fini�=)")