import modeles.dao.FilDAOJdbc;
import modeles.dao.UtilisateurDAOJdbc;
import modeles.dto.Fil;
import modeles.dto.Utilisateur;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

public class TestUtilisateurDAOJdbc {

    //Les tests de ce fichier utilisent les données du fichier insertion.sql

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

    @Test
    public void should_create_a_new_Utilisateur_with_unique_pseudo(){
        UtilisateurDAOJdbc dao = new UtilisateurDAOJdbc();
        Utilisateur u = new Utilisateur("Michel","Bla","Bla","michel@mail","michel", LocalDate.now());
        dao.deleteByPseudo(u.getPseudo());
        assertTrue(dao.save(u));
        assertFalse(dao.save(u)); //Pseudo doit être unique
        u.setPseudo("Michel2");
        assertFalse(dao.save(u)); //Mail doit être unique
    }
    @Test
    public void should_return_all_Utilisateur_from_a_Fil(){
        UtilisateurDAOJdbc daoUtilisateur = new UtilisateurDAOJdbc();
        List<Utilisateur> lU = daoUtilisateur.findAllFromFil(1);
        assertEquals(2,lU.size());
        assertEquals("natgame",lU.get(0).getPseudo());
    }
}
