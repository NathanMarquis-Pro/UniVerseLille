package controlleurs;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modeles.dao.AdministrationDAOJdbc;
import modeles.dao.FilDAOJdbc;
import modeles.dao.InscriptionDAOJdbc;
import modeles.dto.Fil;
import modeles.dto.Utilisateur;
import org.apache.tomcat.jakartaee.commons.lang3.StringEscapeUtils;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/NouveauFil")
public class NouveauFil extends HttpServlet {

    FilDAOJdbc daoFil = new FilDAOJdbc();
    InscriptionDAOJdbc daoInscription = new InscriptionDAOJdbc();
    AdministrationDAOJdbc daoAdministration = new AdministrationDAOJdbc();

    @Override
    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String chemin = "";
        Utilisateur u = (Utilisateur) req.getSession().getAttribute("user");
        if(u == null){
            chemin = "signin.jsp";
            res.sendRedirect(chemin);
            return;
        }
        chemin = "./";
        String titreFil = StringEscapeUtils.escapeHtml4(req.getParameter("titreFil"));

        if(titreFil!=null && !titreFil.isEmpty()){
            Fil f = new Fil(titreFil, LocalDate.now(), u.getUno());
            if(daoFil.save(f)) {
                f.setFno(daoFil.findId(f));
                daoInscription.addUtilisateurToFil(u.getUno(),f.getFno());
                daoAdministration.addAdminUtilisateurToFil(u.getUno(),f.getFno());
            }
        }
        res.sendRedirect(chemin);
    }
}
