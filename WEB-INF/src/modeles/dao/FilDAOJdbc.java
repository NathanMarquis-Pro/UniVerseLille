package modeles.dao;

import modeles.dto.Fil;
import modeles.dto.Utilisateur;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class FilDAOJdbc {

    DS ds;

    public FilDAOJdbc() {
        ds = new DS();
    }

    public Fil findById(int fno) {
        Fil fil;
        try(Connection con = ds.getConnection()){
            String req = "Select fno, titre, d_creation, uno_createur from fils where fno = ?";
            PreparedStatement p = con.prepareStatement(req);
            p.setInt(1,fno);
            ResultSet rs = p.executeQuery();
            rs.next();
            fil = new Fil(rs.getInt(1), rs.getString(2),LocalDate.parse(rs.getString(3)),rs.getInt(4));
            return fil;
        }catch(ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
            return null;
        }
    }
    public List<Fil> findAllForUtilisateur(int uno) {
        List<Fil> fils = new ArrayList<>();
        try(Connection con = ds.getConnection()){
            String req = "select * " +
                    "from fils as f, inscriptions as i " +
                    "where i.fno = f.fno " +
                    "and i.uno = ?";
            PreparedStatement p = con.prepareStatement(req);
            p.setInt(1,uno);
            ResultSet rs = p.executeQuery();
            while(rs.next()){
                Fil fil = new Fil(rs.getInt(1), rs.getString(2),LocalDate.parse(rs.getString(3)),rs.getInt(4));
                fils.add(fil);
            }
            return fils;
        }catch(ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
            return null;
        }
    }
    public boolean save(Fil fil) {
        try(Connection con = ds.getConnection()){
            String req = "INSERT into fils (titre,d_creation,uno_createur) values(?,?,?)";
            PreparedStatement p = con.prepareStatement(req);
            p.setString(1,fil.getTitre());
            p.setString(2,fil.getD_creation().toString());
            p.setInt(3,fil.getUno_createur());
            p.executeUpdate();
            return true;
        }catch(ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean deleteById(int fno){
        try(Connection con = ds.getConnection()){
            String req = "delete from fils where fno = ?";
            PreparedStatement p = con.prepareStatement(req);
            p.setInt(1,fno);
            p.executeUpdate();
            return true;
        }catch(ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
            return false;
        }
    }
}
