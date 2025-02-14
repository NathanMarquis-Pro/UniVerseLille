--Fichier des requêtes pertinentes pour la base de donnée

--Sélectionne toutes les informations de l'utilisateur 1
select pseudo, nom, prenom, email, d_inscription, d_naissance
from utilisateurs
where uno=1;

--Sélectionne tous les messages du fil n°2 et les ranges dans l'ordre des plus récents
select prenom,nom,contenu
from messages as m, utilisateurs as u, fils as f
where m.uno=u.uno
and m.fno = f.fno
and m.fno = 2
Order by m.d_ecriture;

--Sélectionne tous les utilisateurs d'un fil et affiche leurs pseudos
select pseudo
from utilisateurs as u, inscriptions as i
where u.uno = i.uno
and i.fno = 1;

--Sélectionne un seul message précis, et affiche aussi le message auquel il répond
select contenu
from messages
where mno = 5
union
select contenu
from messages
where mno = (select mno_reponse
             from messages
             where mno = 5);

--Sélectionne tous les fils de l'utilisateur 1
select titre
from fils as f, inscriptions as i
where i.fno = f.fno
and i.uno = 1;

--Sélectionne tous les fils de l'utilisateur 1 et tous les messages qu'il a envoyé
select titre, contenu
from fils as f, inscriptions as i, messages as m
where i.fno = f.fno
and m.fno = i.fno
and m.uno = i.uno
and i.uno = 1;

--Sélectionne tous les messages d'un utilisateur dans un fil
select titre, contenu
from fils as f, inscriptions as i, messages as m
where i.fno = f.fno
and m.fno = i.fno
and m.uno = i.uno
and i.fno = 2
and i.uno = 1;