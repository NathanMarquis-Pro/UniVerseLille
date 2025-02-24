package modeles.dao;

import modeles.dto.Fil;
import modeles.dto.Message;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class MessageDAOJdbc {
    DS ds;

    public MessageDAOJdbc(){
        ds = new DS();
    }
    public boolean save(Message message) {
        try(Connection con = ds.getConnection()){
            String req = "INSERT into messages (uno,fno,contenu,d_ecriture,mno_reponse,likes) values(?,?,?,?,?,?)";
            PreparedStatement p = con.prepareStatement(req);
            p.setInt(1,message.getUno());
            p.setInt(2,message.getFno());
            p.setString(3,message.getContenu());
            p.setString(4,message.getD_ecriture().toString());
            p.setInt(5,message.getReponse());
            p.setInt(6,0);
            p.executeUpdate();
            return true;
        }catch(ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
            return false;
        }
    }
    public List<Message> findAllFromFil(int fno) {
        List<Message> messages = new ArrayList<>();
        try(Connection con = ds.getConnection()){
            String req = "select mno, uno, fno, contenu, d_ecriture, mno_reponse, likes\n" +
                    "from messages as m, utilisateurs as u, fils as f\n" +
                    "where m.uno=u.uno\n" +
                    "and m.fno = f.fno\n" +
                    "and m.fno = ?\n" +
                    "Order by m.d_ecriture DESC;";
            PreparedStatement p = con.prepareStatement(req);
            p.setInt(1,fno);
            ResultSet rs = p.executeQuery();
            while(rs.next()){
                Message mess = new Message();
                messages.add(mess);
            }
            return messages;
        }catch(ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
            return null;
        }
    }
}
