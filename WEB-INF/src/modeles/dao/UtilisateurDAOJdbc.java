package modeles.dao;

import modeles.dto.Utilisateur;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class UtilisateurDAOJdbc{

    DS ds;

    public UtilisateurDAOJdbc(){
        ds = new DS();
    }
    
    public boolean save(Utilisateur utilisateur) {
        try(Connection con = ds.getConnection()){
            String req = "INSERT into utilisateurs (pseudo, nom, prenom, email, mdp, d_inscription, d_naissance) values(?,?,?,?,?,?,?)";
            PreparedStatement p = con.prepareStatement(req);
            p.setString(1,utilisateur.getPseudo());
            p.setString(2,utilisateur.getNom());
            p.setString(3,utilisateur.getPrenom());
            p.setString(4,utilisateur.getEmail());
            p.setString(5,utilisateur.getMdp());
            p.setString(6,utilisateur.getD_inscription().toString());
            if(utilisateur.getD_naissance()!=null){
                p.setString(7,utilisateur.getD_naissance().toString());
            }else {
                p.setString(7,null);
            }
            return p.executeUpdate() != 0;
        }catch(ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean deleteById(int uno){
        try(Connection con = ds.getConnection()){
            String req = "delete from utilisateurs where uno = ?";
            PreparedStatement p = con.prepareStatement(req);
            p.setInt(1,uno);
            return p.executeUpdate() != 0;
        }catch(ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
            return false;
        }
    }
    public boolean deleteByPseudo(String pseudo){
        try(Connection con = ds.getConnection()){
            String req = "delete from utilisateurs where pseudo = ?";
            PreparedStatement p = con.prepareStatement(req);
            p.setString(1,pseudo);
            return p.executeUpdate() != 0;
        }catch(ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean isMdpCorrect(int uno, String mdp){
        try(Connection con = ds.getConnection()){
            String req = "Select mdp from utilisateurs where uno = ?";
            PreparedStatement p = con.prepareStatement(req);
            p.setInt(1,uno);
            ResultSet rs = p.executeQuery();
            rs.next();
            return rs.getString(1).equals(mdp);
        }catch(ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
            return false;
        }
    }

    public Utilisateur findById(int uno) {
        Utilisateur utilisateur;
        try(Connection con = ds.getConnection()){
            String req = "Select uno, pseudo, prenom, nom, email, mdp, d_inscription, d_naissance from utilisateurs where uno = ?";
            PreparedStatement p = con.prepareStatement(req);
            p.setInt(1,uno);
            ResultSet rs = p.executeQuery();
            rs.next();
            utilisateur = new Utilisateur(rs.getInt(1),rs.getString(2),rs.getString(3),
                    rs.getString(4),rs.getString(5),rs.getString(6),LocalDate.parse(rs.getString(7)));
            if(rs.getString(8)!=null)utilisateur.setD_naissance(LocalDate.parse(rs.getString(8)));
            return utilisateur;
        }catch(ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
            return null;
        }
    }

    public List<Utilisateur> findAllFromFil(int fno) {
        List<Utilisateur> utilisateurs = new ArrayList<>();
        try(Connection con = ds.getConnection()){
            String req = "select u.uno, pseudo, nom, prenom, email, mdp, d_inscription, d_naissance " +
                    "from utilisateurs as u, inscriptions as i " +
                    "where u.uno = i.uno " +
                    "and i.fno = ?";
            PreparedStatement p = con.prepareStatement(req);
            p.setInt(1,fno);
            ResultSet rs = p.executeQuery();
            while(rs.next()){
                Utilisateur utilisateur = new Utilisateur(rs.getInt(1),rs.getString(2),rs.getString(3),
                        rs.getString(4),rs.getString(5),rs.getString(6),
                        LocalDate.parse(rs.getString(7)));
                if(rs.getString(8)!=null)utilisateur.setD_naissance(LocalDate.parse(rs.getString(8)));
                utilisateurs.add(utilisateur);
            }
            return utilisateurs;
        }catch(ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
            return null;
        }
    }
}
