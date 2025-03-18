package controlleurs;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modeles.dao.AdministrationDAOJdbc;
import modeles.dao.InscriptionDAOJdbc;
import modeles.dao.UtilisateurDAOJdbc;
import modeles.dto.Utilisateur;
import org.apache.commons.lang3.StringEscapeUtils;

import java.io.IOException;
@WebServlet("/AjouterParticipant")
public class AjouterParticipant extends HttpServlet {

    InscriptionDAOJdbc daoInscription = new InscriptionDAOJdbc();
    UtilisateurDAOJdbc daoUtilisateur = new UtilisateurDAOJdbc();
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
        String pseudo = StringEscapeUtils.escapeHtml4(req.getParameter("pseudoParticipant"));
        int fno = Integer.parseInt(req.getParameter("fno"));
        if(fno==0){
            RequestDispatcher rd= req.getRequestDispatcher(chemin);
            rd.forward(req,res);
            return;
        }
        if(daoAdministration.isAdmin(u.getUno(),fno)){
            if(pseudo!=null && !pseudo.isEmpty()){
                daoInscription.addUtilisateurToFil(daoUtilisateur.findByPseudo(pseudo).getUno(),fno);
            }
        }
        RequestDispatcher rd= req.getRequestDispatcher(chemin);
        rd.forward(req,res);
    }
}
