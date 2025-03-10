package modeles.dto;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Fil {
    private int fno;
    private String titre;
    private LocalDate d_creation;
    private int uno_createur;
    private List<Message> messages;

    public Fil(int fno, String titre, LocalDate d_creation, int uno_createur) {
        this.fno = fno;
        this.titre = titre;
        this.d_creation = d_creation;
        this.uno_createur = uno_createur;
        this.messages = new ArrayList<>();
    }

    public Fil(String titre, LocalDate d_creation, int uno_createur) {
        this(-1,titre,d_creation,uno_createur);
    }

    public List<Message> getMessages() {
        return messages;
    }

    public void setMessages(List<Message> messages) {
        this.messages = messages;
    }

    public int getFno() {
        return fno;
    }

    public void setFno(int fno) {
        this.fno = fno;
    }

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public LocalDate getD_creation() {
        return d_creation;
    }

    public void setD_creation(LocalDate d_creation) {
        this.d_creation = d_creation;
    }

    public int getUno_createur() {
        return uno_createur;
    }

    public void setUno_createur(int uno_createur) {
        this.uno_createur = uno_createur;
    }
}
