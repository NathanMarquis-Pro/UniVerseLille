package controlleurs;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modeles.dao.UtilisateurDAOJdbc;
import modeles.dto.Utilisateur;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;

@WebServlet("/Inscription")
public class Inscription extends HttpServlet {
    UtilisateurDAOJdbc dao = new UtilisateurDAOJdbc();
    @Override
    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String login = req.getParameter("login");
        String nom = req.getParameter("nom");
        String prenom = req.getParameter("prenom");
        String dNaissance = req.getParameter("d_naissance");
        String email = req.getParameter("email");
        String mdpVerif = req.getParameter("mdpVerif");
        String mdp = req.getParameter("mdp");
        HttpSession session = req.getSession(true);
        if(nom==null || prenom == null || email == null || mdpVerif==null || mdp == null || login == null
                || nom.isEmpty() || prenom.isEmpty() || email.isEmpty() || mdpVerif.isEmpty() || login.isEmpty() || mdp.isEmpty()
                || !mdp.equals(mdpVerif)){
            session.setAttribute("tentative","<h4>Merci de remplir tous les champs</h4>");
            res.sendRedirect("signup.jsp");
            return;
        }
        try {
            Utilisateur u;
            if(dNaissance==null || dNaissance.isEmpty()){
                u =  new Utilisateur(login,nom,prenom,email,mdp, LocalDate.now());
            }
            else {
                u = new Utilisateur(login,nom,prenom,email,mdp, LocalDate.now(),LocalDate.parse(dNaissance));
            }
            if(!dao.save(u)){
                session.setAttribute("tentative","<h4>Erreur lors de la création, veuillez réessayer</h4>");
                res.sendRedirect("signup.jsp");
                System.out.println("cassé");
                return;
            }
            session.setAttribute("tentative",null);
            res.sendRedirect("signin.jsp"); //TODO Trouver un moyen d'afficher que l'utilisateur a été créé
        }catch (DateTimeParseException e){
            session.setAttribute("tentative","<h4>Valeur de date de naissance invalide</h4>");
            res.sendRedirect("signup.jsp");
        }
    }
}
