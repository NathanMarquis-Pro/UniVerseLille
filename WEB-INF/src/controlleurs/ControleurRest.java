package controlleurs;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modeles.dao.FilDAOJdbc;
import modeles.dao.MessageDAOJdbc;
import modeles.dto.Fil;
import modeles.dto.Utilisateur;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/allMessages/*")
public class ControleurRest extends HttpServlet {

    FilDAOJdbc dao = new FilDAOJdbc();
    MessageDAOJdbc daoMessages = new MessageDAOJdbc();
    ObjectMapper objectMapper = new ObjectMapper();
    public void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        objectMapper.registerModule(new JavaTimeModule());
        res.setContentType("application/json;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Utilisateur u = (Utilisateur) req.getSession().getAttribute("user");
        if(u==null){
            res.sendRedirect("../signin.jsp");
            return;
        }
        String info = req.getPathInfo();
        if (info == null || info.equals("/")) {
            List<Fil> fils = dao.findAllForUtilisateur(u.getUno());
            for(Fil f : fils){
                f.setMessages(daoMessages.findAllFromFil(f.getFno()));
            }
            String jsonstring = objectMapper.writeValueAsString(fils);
            out.print(jsonstring);
            return;
        }
        String[] splits = info.split("/");
        if (splits.length != 2) {
            res.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }
        String id = splits[1];
        Fil fil = dao.findById(Integer.parseInt(id));
        if (fil==null) {
            res.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        fil.setMessages(daoMessages.findAllFromFil(fil.getFno()));
        out.print(objectMapper.writeValueAsString(fil));
    }
}
