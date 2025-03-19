package modeles.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DS {

    private final String DRIVER;
    private final String URL;
    private String Utilisateur;
    private String Mdp;

    public DS(){
        DRIVER ="org.postgresql.Driver";
        URL ="jdbc:postgresql://localhost:5432/but2"; // <- Changer si : ordinateurs de l'établissements: "jdbc:postgresql://psqlserv/but2",machine personnelle "jdbc:postgresql://localhost:5432/but2"
        Utilisateur ="prenomnometu"; // <- REMPLACEZ CETTE VALEUR
        Mdp ="moi";
    }

    public Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName(DRIVER);
        return DriverManager.getConnection(URL, Utilisateur, Mdp);
    }
}
