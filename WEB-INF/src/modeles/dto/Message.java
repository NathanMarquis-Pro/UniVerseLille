package modeles.dto;

import java.time.LocalDateTime;

public class Message {
    private int mno;
    private int uno;
    private int fno;
    private String contenu;
    private LocalDateTime d_ecriture;
    private int reponse;
    private int likes;

    public Message(int mno, int uno, int fno, String contenu, LocalDateTime d_ecriture, int reponse, int likes) {
        this.mno = mno;
        this.uno = uno;
        this.fno = fno;
        this.contenu = contenu;
        this.d_ecriture = d_ecriture;
        this.reponse = reponse;
        this.likes = likes;
    }

    public Message(int uno, int fno, String contenu, LocalDateTime d_ecriture, int reponse, int likes) {
        this(-1,uno, fno, contenu, d_ecriture, reponse, likes);
    }

    public Message() {
    }

    public int getMno() {
        return mno;
    }

    public void setMno(int mno) {
        this.mno = mno;
    }

    public int getUno() {
        return uno;
    }

    public void setUno(int uno) {
        this.uno = uno;
    }

    public int getFno() {
        return fno;
    }

    public void setFno(int fno) {
        this.fno = fno;
    }

    public String getContenu() {
        return contenu;
    }

    public void setContenu(String contenu) {
        this.contenu = contenu;
    }

    public LocalDateTime getD_ecriture() {
        return d_ecriture;
    }

    public void setD_ecriture(LocalDateTime d_ecriture) {
        this.d_ecriture = d_ecriture;
    }

    public int getReponse() {
        return reponse;
    }

    public void setReponse(int reponse) {
        this.reponse = reponse;
    }

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }

}
