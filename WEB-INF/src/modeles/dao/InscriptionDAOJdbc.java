package modeles.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
            System.out.println(e.getMessage());
            return false;
        }
    }
    public boolean removeUtilisateurToFil(int uno,int fno){
        try(Connection con = ds.getConnection()){
            String req = "delete from inscriptions where uno = ? and fno = ?";
            PreparedStatement p = con.prepareStatement(req);
            p.setInt(1,uno);
            p.setInt(2,fno);
            return p.executeUpdate()!=0;
        }catch(ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
            return false;
        }
    }
}
