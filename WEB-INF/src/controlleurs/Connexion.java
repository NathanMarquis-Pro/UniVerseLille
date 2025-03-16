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
@WebServlet("/Connexion")
public class Connexion extends HttpServlet {
    UtilisateurDAOJdbc dao = new UtilisateurDAOJdbc();
    @Override
    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String login = req.getParameter("login");
        String mdp = req.getParameter("mdp");
        HttpSession session = req.getSession(true);
        if(mdp == null || login == null || login.isEmpty() || mdp.isEmpty()){
            res.sendRedirect("signin.jsp?tentative=1");
        }
        else if(dao.isMdpCorrect(login,mdp)){
            Utilisateur u = dao.findByPseudo(login);
            session.setAttribute("user",u);
            res.sendRedirect("./");
        }
        else {
            res.sendRedirect("signin.jsp?tentative=1");
        }
    }
}
