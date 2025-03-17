package modeles.dto;

import java.time.LocalDate;

public class Utilisateur {
    private int uno;
    private String pseudo;
    private String nom;
    private String prenom;
    private String email;
    private String mdp;
    private LocalDate d_inscription;
    private LocalDate d_naissance;

    public Utilisateur(int uno, String pseudo, String nom, String prenom, String email, String mdp, LocalDate d_inscription, LocalDate d_naissance) {
        this.uno = uno;
        this.pseudo = pseudo;
        this.nom = nom;
        this.prenom = prenom;
        this.email = email;
        this.mdp = mdp;
        this.d_inscription = d_inscription;
        this.d_naissance = d_naissance;
    }

    public Utilisateur(int uno, String pseudo, String nom, String prenom, String email, String mdp, LocalDate d_inscription) {
        this(uno,pseudo,nom,prenom,email,mdp,d_inscription,null);
    }
    public Utilisateur(String pseudo, String nom, String prenom, String email, String mdp, LocalDate d_inscription) {
        this(-1,pseudo,nom,prenom,email,mdp,d_inscription,null);
    }
    public Utilisateur(String pseudo, String nom, String prenom, String email, String mdp, LocalDate d_inscription, LocalDate d_naissance) {
        this(-1,pseudo,nom,prenom,email,mdp,d_inscription,d_naissance);
    }
    public Utilisateur() {
    }

    public int getUno() {
        return uno;
    }

    public void setUno(int uno) {
        this.uno = uno;
    }

    public String getPseudo() {
        return pseudo;
    }

    public void setPseudo(String pseudo) {
        this.pseudo = pseudo;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMdp() {
        return mdp;
    }

    public void setMdp(String mdp) {
        this.mdp = mdp;
    }

    public LocalDate getD_inscription() {
        return d_inscription;
    }

    public void setD_inscription(LocalDate d_inscription) {
        this.d_inscription = d_inscription;
    }

    public LocalDate getD_naissance() {
        return d_naissance;
    }

    public void setD_naissance(LocalDate d_naissance) {
        this.d_naissance = d_naissance;
    }
}
