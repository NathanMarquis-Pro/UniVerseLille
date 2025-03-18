package modeles.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdministrationDAOJdbc {
    DS ds;

    public AdministrationDAOJdbc() {
        ds = new DS();
    }

    public boolean addAdminUtilisateurToFil(int uno,int fno){
        try(Connection con = ds.getConnection()){
            String req = "INSERT into administrations (uno,fno) values(?,?)";
            PreparedStatement p = con.prepareStatement(req);
            p.setInt(1,uno);
            p.setInt(2,fno);
            return p.executeUpdate()!=0;
        }catch(ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
            return false;
        }
    }
    public boolean removeAdminUtilisateurToFil(int uno,int fno){
        try(Connection con = ds.getConnection()){
            String req = "delete from administrations where uno = ? and fno = ?";
            PreparedStatement p = con.prepareStatement(req);
            p.setInt(1,uno);
            p.setInt(2,fno);
            return p.executeUpdate()!=0;
        }catch(ClassNotFoundException | SQLException e){
            return false;
        }
    }

    public boolean isAdmin(int uno, int fno) {
        try(Connection con = ds.getConnection()){
            String req = "select * from administrations where uno = ? and fno = ?";
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
