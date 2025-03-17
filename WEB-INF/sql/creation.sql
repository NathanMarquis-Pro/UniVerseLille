drop table if exists messages, inscriptions, administrations, fils, utilisateurs CASCADE;

CREATE TABLE utilisateurs(
	uno serial,
	pseudo VARCHAR(20) UNIQUE NOT NULL,
	nom text,
	prenom text,
	email text UNIQUE NOT NULL,
	mdp text NOT NULL,
	d_inscription text NOT NULL,
	d_naissance text,
	CONSTRAINT pk_utilisateurs PRIMARY KEY (uno)
);

CREATE TABLE fils(
	fno serial,
	titre VARCHAR(50) NOT NULL,
	d_creation TEXT,
	uno_createur int,
	CONSTRAINT pk_fils PRIMARY KEY (fno),
	CONSTRAINT fk_utilisateurs FOREIGN KEY (uno_createur) REFERENCES utilisateurs(uno)
);

CREATE TABLE inscriptions(
	uno int,
	fno int,
	CONSTRAINT pk_inscription PRIMARY KEY (uno, fno),
	CONSTRAINT fk_utilisateurs FOREIGN KEY (uno) REFERENCES utilisateurs(uno) ON DELETE CASCADE,
	CONSTRAINT fk_fils FOREIGN KEY (fno) REFERENCES fils(fno) ON DELETE CASCADE
);

CREATE TABLE administrations(
	uno int,
	fno int,
	CONSTRAINT pk_administration PRIMARY KEY (uno, fno),
	CONSTRAINT fk_utilisateurs FOREIGN KEY (uno) REFERENCES utilisateurs(uno) ON DELETE CASCADE,
	CONSTRAINT fk_fils FOREIGN KEY (fno) REFERENCES fils(fno) ON DELETE CASCADE
);

CREATE TABLE messages(
	mno serial,
	uno int,
	fno int,
	contenu text NOT NULL,
	imgPath text,
	d_ecriture text,
	mno_reponse int,
	likes int,
	CONSTRAINT pk_message PRIMARY KEY (mno),
	CONSTRAINT fk_utilisateurs FOREIGN KEY (uno) REFERENCES utilisateurs(uno) ON DELETE CASCADE,
    CONSTRAINT fk_fils FOREIGN KEY (fno) REFERENCES fils(fno) ON DELETE CASCADE,
    CONSTRAINT fk_reponse FOREIGN KEY (mno_reponse) REFERENCES messages(mno)
);