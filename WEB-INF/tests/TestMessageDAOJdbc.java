import modeles.dao.MessageDAOJdbc;
import modeles.dto.Message;
import org.junit.jupiter.api.Test;

import java.time.LocalDateTime;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class TestMessageDAOJdbc {
    @Test
    public void should_create_a_new_Message(){
        MessageDAOJdbc dao = new MessageDAOJdbc();
        Message m = new Message(1,2,"Test", LocalDateTime.parse(LocalDateTime.now().format(Message.CUSTOM_FORMATTER),Message.CUSTOM_FORMATTER),
                -1,0);
        dao.save(m);
        assertEquals(m.getContenu(),dao.findById(7).getContenu());
    }
    @Test
    public void should_return_all_Message_from_a_Fil(){

    }
    @Test
    public void should_modify_likes(){
        MessageDAOJdbc dao = new MessageDAOJdbc();
        int mno = 1;
        Message m = dao.findById(mno);
        assertEquals(0, m.getLikes());
        m.setLikes(m.getLikes()+1);
        dao.modifierLike(m);
        assertEquals(1, m.getLikes());
        m.setLikes(m.getLikes()-1);
        dao.modifierLike(m);
        assertEquals(0, m.getLikes());
    }
}
