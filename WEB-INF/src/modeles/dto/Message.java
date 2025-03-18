package modeles.dto;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

public class Message {
    private int mno;
    private int uno;
    private String pseudo;
    private int fno;
    private String contenu;
    private LocalDateTime d_ecriture;
    private int reponse;
    private Message messageReponse;
    private int likes;
    public final static DateTimeFormatter CUSTOM_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    public final static DateTimeFormatter CUSTOM_FORMATTER2 = DateTimeFormatter.ofPattern("dd/MM/yy");
    public final static DateTimeFormatter DATE_FORMATER_FULL = DateTimeFormatter.ofPattern("EEEE d MMMM yyyy HH:mm:ss", Locale.FRENCH);

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

    public String getPseudo() {
        return pseudo;
    }

    public void setPseudo(String pseudo) {
        this.pseudo = pseudo;
    }

    public Message getMessageReponse() {
        return messageReponse;
    }

    public void setMessageReponse(Message messageReponse) {
        this.messageReponse = messageReponse;
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
