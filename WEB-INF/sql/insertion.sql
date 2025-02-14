\i creation.sql

insert into utilisateur(pseudo,prenom,nom,email,mdp,d_inscription) values
('natgame','Nathan','Marquis','nathan@mail','moi','14/02/2025'),
('tyroine','Mathis','Lisiak','mathis@mail','moi','15/02/2025'),
('bernard','Bernard','Bernard','bernard@mail','bernard','14/02/1990'),
('Sonic','Sonic','TheHedgehog','sonic@mail','moi','14/02/2025'),
('Bowser','Bowser','Koopa','bowser@mail','moi','14/02/2025'),
('Crash','Crash','Bandicoot','nathan@mail','moi','14/02/2025');

insert into fil(titre,d_creation,createur) values
('Jeux vidéo','14/02/2025',(Select uno from utilisateur where nom = 'Marquis')),
('Mariage de Mario','10/02/2025',(Select uno from utilisateur where nom = 'Bowser'));

insert into inscription(fno,uno) values
((Select fno from fil where titre = 'Jeux vidéo'),(Select uno from utilisateur where nom = 'Lisiak')),
((Select fno from fil where titre = 'Mariage de Mario'),(Select uno from utilisateur where nom = 'TheHedgehog')),
((Select fno from fil where titre = 'Mariage de Mario'),(Select uno from utilisateur where nom = 'Marquis')),
((Select fno from fil where titre = 'Mariage de Mario'),(Select uno from utilisateur where nom = 'Bandicoot'));

insert into administration(fno,uno) values
((Select fno from fil where titre = 'Jeux vidéo'),(Select uno from utilisateur where nom = 'Marquis')),
((Select fno from fil where titre = 'Jeux vidéo'),(Select uno from utilisateur where nom = 'Lisiak')),
((Select fno from fil where titre = 'Mariage de Mario'),(Select uno from utilisateur where nom = 'TheHedgehog'));

insert into message(fno,uno,contenu,d_ecriture) values
(1,1,'Bonjour','14/02/2025'),
(1,2,'Ca va ?','14/02/2025'),
(2,1,'Bonjour','18/02/2025'),
(2,5,'Bon alors on fait quoi comme animation ? On peut kidnapper Peach ?','18/02/2025'),
(2,4,'Non, laisse la vivre wsh','18/02/2025');