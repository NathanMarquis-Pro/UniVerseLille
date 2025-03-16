package modeles.dao;

import modeles.dto.Fil;
import modeles.dto.Message;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class MessageDAOJdbc {
    DS ds;

    public MessageDAOJdbc(){
        ds = new DS();
    }
    public boolean save(Message message) {
        try(Connection con = ds.getConnection()){
            String req = "";
            if(message.getReponse()!=-1)
            req = "INSERT into messages (uno,fno,contenu,d_ecriture,likes,mno_reponse) values(?,?,?,?,?,?)";
            else req = "INSERT into messages (uno,fno,contenu,d_ecriture,likes) values(?,?,?,?,?)";
            PreparedStatement p = con.prepareStatement(req);
            p.setInt(1,message.getUno());
            p.setInt(2,message.getFno());
            p.setString(3,message.getContenu());
            p.setString(4,message.getD_ecriture().format(Message.CUSTOM_FORMATTER));
            p.setInt(5,0);
            if(message.getReponse()!=-1) p.setInt(6,message.getReponse());
            return p.executeUpdate() != 0;
        }catch(ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
            return false;
        }
    }
    public Message findById(int mno) {
        try(Connection con = ds.getConnection()){
            String req = "select mno, uno, fno, contenu, d_ecriture, mno_reponse, likes\n" +
                    "from messages as m " +
                    "where m.mno = ?\n";
            PreparedStatement p = con.prepareStatement(req);
            p.setInt(1,mno);
            ResultSet rs = p.executeQuery();
            if(rs.next()){
                return new Message(rs.getInt(1),rs.getInt(2), rs.getInt(3),
                        rs.getString(4), LocalDateTime.parse(rs.getString(5), Message.CUSTOM_FORMATTER),
                        rs.getInt(6),rs.getInt(7));
            }
            return null;

        }catch(ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
            return null;
        }
    }
    public List<Message> findAllFromFil(int fno) {
        List<Message> messages = new ArrayList<>();
        try(Connection con = ds.getConnection()){
            String req = "select mno, uno, fno, contenu, d_ecriture, mno_reponse, likes\n" +
                    "from messages as m " +
                    "where m.fno = ?\n" +
                    "Order by m.d_ecriture ASC;";
            PreparedStatement p = con.prepareStatement(req);
            p.setInt(1,fno);
            ResultSet rs = p.executeQuery();
            while(rs.next()){
                Message mess = new Message(rs.getInt(1),rs.getInt(2), rs.getInt(3),
                        rs.getString(4), LocalDateTime.parse(rs.getString(5), Message.CUSTOM_FORMATTER),
                        rs.getInt(6),rs.getInt(7));
                if(mess.getReponse()!=0){
                    mess.setMessageReponse(this.findById(mess.getReponse()));
                }
                messages.add(mess);
            }
            return messages;
        }catch(ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
            return null;
        }
    }
    public void modifierLike(Message m){
        try(Connection con = ds.getConnection()){
            String req = "update messages set likes = likes + ? where mno = ?";
            PreparedStatement p = con.prepareStatement(req);
            p.setInt(1,m.getLikes());
            p.setInt(2,m.getMno());
            p.executeUpdate();
        }catch(ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
        }
    }
}
