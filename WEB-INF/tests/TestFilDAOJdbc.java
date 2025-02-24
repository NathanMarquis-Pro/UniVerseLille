import modeles.dao.FilDAOJdbc;
import modeles.dao.FilDAOJdbc;
import modeles.dto.Fil;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

public class TestFilDAOJdbc {

    //Les tests de ce fichier utilisent les données du fichier insertion.sql
    //Avant d'effectuer les tests, relancer le script insertion.sql

    @Test
    public void should_return_the_correct_Fil(){
        FilDAOJdbc dao = new FilDAOJdbc();
        Fil f = dao.findById(1);
        assertEquals("Jeux vidéo",f.getTitre());
        assertEquals("2025-02-14",f.getD_creation().toString());
    }

    @Test
    public void should_create_a_new_Fil(){
        FilDAOJdbc dao = new FilDAOJdbc();
        dao.deleteById(3);
        Fil f = new Fil("Discussion",LocalDate.now(),1);
        assertTrue(dao.save(f));
        assertEquals(f.getTitre(),dao.findById(3).getTitre());
    }
    @Test
    public void should_return_all_Fil_for_an_Utilisateur(){
        FilDAOJdbc daoFil = new FilDAOJdbc();
        List<Fil> lF = daoFil.findAllForUtilisateur(1);
        assertEquals(2,lF.size());
        assertEquals("Jeux vidéo",lF.get(0).getTitre());
    }
}
