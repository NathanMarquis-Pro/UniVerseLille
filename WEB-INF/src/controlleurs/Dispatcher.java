package controlleurs;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modeles.dao.MessageDAOJdbc;
import modeles.dto.Utilisateur;

import java.io.IOException;

@WebServlet("/")
public class Dispatcher extends HttpServlet {
    @Override
    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String chemin = "";
        Utilisateur u = (Utilisateur) req.getSession().getAttribute("user");
        if(u == null){
            chemin = "signin.jsp";
            res.sendRedirect(chemin);
            return;
        }
        String action = req.getParameter("action");
        if(action==null) action = "";
        switch (action){
            case "modifierCompte" : chemin = "WEB-INF/MonCompte.jsp";break;
            case "nouveauFil" : chemin = "WEB-INF/CreationFil.jsp";break;
            case "modifierFil" : chemin = "WEB-INF/ModifierFil.jsp";break;
            default:
                String fnoString = req.getParameter("fno");
                try {
                    if(fnoString == null || fnoString.isEmpty()) throw new NumberFormatException();
                    int fno = Integer.parseInt(fnoString);
                    if(fno == 0)throw new NumberFormatException();
                    MessageDAOJdbc daoMessage = new MessageDAOJdbc();
                    req.setAttribute("fno",fno);
                    req.setAttribute("messages",daoMessage.findAllFromFil(fno));
                }
                catch (NumberFormatException e){
                    req.setAttribute("messages",null);
                }
                chemin = "WEB-INF/Accueil.jsp";
        }
        RequestDispatcher rd= req.getRequestDispatcher(chemin);
        rd.forward(req,res);
    }
}
