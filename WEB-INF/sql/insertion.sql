\i creation.sql

insert into utilisateurs(pseudo,prenom,nom,email,mdp,d_inscription) values
('natgame','Nathan','Marquis','nathan@mail','moi','2025-02-14'),
('tyroine','Mathis','Lisiak','mathis@mail','moi','2025-02-15'),
('bernard','Bernard','Bernard','bernard@mail','bernard','1990-02-14'),
('Sonic','Sonic','TheHedgehog','sonic@mail','moi','2025-02-14'),
('Bowser','Bowser','Koopa','bowser@mail','moi','2025-02-14'),
('Crash','Crash','Bandicoot','crash@mail','moi','2025-02-14');

insert into fils(titre,d_creation,uno_createur) values
('Jeux vidéo','2025-02-14',(Select uno from utilisateurs where nom = 'Marquis')),
('Mariage de Mario','2025-02-10',(Select uno from utilisateurs where nom = 'Bowser'));

insert into inscriptions(fno,uno) values
((Select fno from fils where titre = 'Jeux vidéo'),(Select uno from utilisateurs where nom = 'Lisiak')),
((Select fno from fils where titre = 'Jeux vidéo'),(Select uno from utilisateurs where nom = 'Marquis')),
((Select fno from fils where titre = 'Mariage de Mario'),(Select uno from utilisateurs where nom = 'TheHedgehog')),
((Select fno from fils where titre = 'Mariage de Mario'),(Select uno from utilisateurs where nom = 'Marquis')),
((Select fno from fils where titre = 'Mariage de Mario'),(Select uno from utilisateurs where nom = 'Bandicoot'));

insert into administrations(fno,uno) values
((Select fno from fils where titre = 'Jeux vidéo'),(Select uno from utilisateurs where nom = 'Marquis')),
((Select fno from fils where titre = 'Jeux vidéo'),(Select uno from utilisateurs where nom = 'Lisiak')),
((Select fno from fils where titre = 'Mariage de Mario'),(Select uno from utilisateurs where nom = 'TheHedgehog')),
((Select fno from fils where titre = 'Mariage de Mario'),(Select uno from utilisateurs where nom = 'Marquis'));

insert into messages(fno,uno,contenu,d_ecriture) values
(1,1,'Bonjour','2025-02-14 18:00:00'),
(1,2,'Ca va ?','2025-02-14 18:00:01'),
(2,1,'Bonjour','2025-02-18 18:00:00'),
(2,5,'Bon alors on fait quoi comme animation ? On peut kidnapper Peach ?','2025-02-18 19:00:00');

insert into messages(fno,uno,contenu,d_ecriture,mno_reponse) values
(2,4,'Non, laisse la vivre wsh','2025-02-18 20:00:00',(select mno from messages where d_ecriture = '2025-02-18 19:00:00')),
(2,1,'Il a raison','2025-02-18 21:00:00',(select mno from messages where d_ecriture = '2025-02-18 20:00:00'));