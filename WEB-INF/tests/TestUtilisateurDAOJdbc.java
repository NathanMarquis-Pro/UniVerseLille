import modeles.dao.UtilisateurDAOJdbc;
import modeles.dto.Utilisateur;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class TestUtilisateurDAOJdbc {
    @Test
    public void should_know_if_a_password_is_correct(){
        UtilisateurDAOJdbc dao = new UtilisateurDAOJdbc();
        assertTrue(dao.isMdpCorrect(1,"moi"));
        assertFalse(dao.isMdpCorrect(1,"moii"));
        assertTrue(dao.isMdpCorrect(3,"bernard"));
    }

    @Test
    public void should_return_the_correct_Utilisateur(){
        UtilisateurDAOJdbc dao = new UtilisateurDAOJdbc();
        Utilisateur u = dao.findById(1);
        assertEquals("natgame",u.getPseudo());
        assertEquals("2025-02-14",u.getD_inscription().toString());
    }
}
