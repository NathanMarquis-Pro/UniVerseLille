drop table if exists message, fil, inscription, administration, utilisateur CASCADE;

DROP TABLE IF EXISTS Utilisateur, Fil, Message, Inscription;

CREATE TABLE utilisateur(
	uno serial,
	pseudo VARCHAR(20) UNIQUE NOT NULL,
	nom text,
	prenom text,
	email text NOT NULL,
	mdp text NOT NULL,
	d_inscription TEXT NOT NULL,
	CONSTRAINT pk_utilisateur PRIMARY KEY (uno)
);

CREATE TABLE fil(
	fno serial,
	titre VARCHAR(50) NOT NULL,
	d_creation TEXT,
	createur int,
	CONSTRAINT pk_fil PRIMARY KEY (fno),
	CONSTRAINT fk_utilisateur FOREIGN KEY (createur) REFERENCES utilisateur(uno)
);

CREATE TABLE inscription(
	uno int,
	fno int,
	CONSTRAINT pk_inscription PRIMARY KEY (uno, fno),
	CONSTRAINT fk_utilisateur FOREIGN KEY (uno) REFERENCES utilisateur(uno) ON DELETE CASCADE,
	CONSTRAINT fk_fil FOREIGN KEY (fno) REFERENCES fil(fno) ON DELETE CASCADE
);

CREATE TABLE administration(
	uno int,
	fno int,
	CONSTRAINT pk_administration PRIMARY KEY (uno, fno),
	CONSTRAINT fk_utilisateur FOREIGN KEY (uno) REFERENCES utilisateur(uno) ON DELETE CASCADE,
	CONSTRAINT fk_fil FOREIGN KEY (fno) REFERENCES fil(fno) ON DELETE CASCADE
);

CREATE TABLE message(
	mno serial,
	uno int,
	fno int,
	contenu text NOT NULL,
	d_ecriture text,
	likes int,
	CONSTRAINT pk_message PRIMARY KEY (mno),
	CONSTRAINT fk_utilisateur FOREIGN KEY (uno) REFERENCES utilisateur(uno) ON DELETE CASCADE,
    CONSTRAINT fk_fil FOREIGN KEY (fno) REFERENCES fil(fno) ON DELETE CASCADE
);