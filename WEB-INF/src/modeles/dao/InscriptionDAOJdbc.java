package modeles.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class InscriptionDAOJdbc {
    DS ds;

    public InscriptionDAOJdbc() {
        ds = new DS();
    }

    public boolean addUtilisateurToFil(int uno,int fno){
        try(Connection con = ds.getConnection()){
            String req = "INSERT into inscriptions (uno,fno) values(?,?)";
            PreparedStatement p = con.prepareStatement(req);
            p.setInt(1,uno);
            p.setInt(2,fno);
            return p.executeUpdate()!=0;
        }catch(ClassNotFoundException | SQLException e){
            return false;
        }
    }
    public boolean removeUtilisateurFromFil(int uno, int fno){
        try(Connection con = ds.getConnection()){
            String req = "delete from inscriptions where uno = ? and fno = ?";
            PreparedStatement p = con.prepareStatement(req);
            p.setInt(1,uno);
            p.setInt(2,fno);
            return p.executeUpdate()!=0;
        }catch(ClassNotFoundException | SQLException e){
            return false;
        }
    }
    public boolean isInscrit(int uno,int fno){
        try(Connection con = ds.getConnection()){
            String req = "select * from inscriptions where uno = ? and fno = ?";
            PreparedStatement p = con.prepareStatement(req);
            p.setInt(1,uno);
            p.setInt(2,fno);
            ResultSet rs = p.executeQuery();
            rs.next();
            return rs.getInt(1)!=0;
        }catch(ClassNotFoundException | SQLException e){
            return false;
        }
    }
}
