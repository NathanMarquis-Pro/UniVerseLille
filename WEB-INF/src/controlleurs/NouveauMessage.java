package controlleurs;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import modeles.dao.MessageDAOJdbc;
import modeles.dao.UtilisateurDAOJdbc;
import modeles.dto.Message;
import modeles.dto.Utilisateur;
import org.apache.commons.lang3.StringEscapeUtils;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet("/NouveauMessage")
public class NouveauMessage extends HttpServlet{
    MessageDAOJdbc dao = new MessageDAOJdbc();
    private static final String IMG_PATH = "./WEB-INF/img/";
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
        String message = StringEscapeUtils.escapeHtml4(req.getParameter("message"));
        int fno = Integer.parseInt(req.getParameter("fno"));
        if(fno==0){
            res.sendRedirect(chemin);
            return;
        }
        String reponseString = req.getParameter("reponse");
        int reponse = 0;
        if(reponseString!=null && !reponseString.isEmpty()){
            reponse = Integer.parseInt(reponseString);
        }

        //Part img = req.getPart("image");
        String uploadPath = IMG_PATH+u.getPseudo();
        File uploadDir = new File(uploadPath);
        if(!uploadDir.exists()) uploadDir.mkdir();
        if((message!=null && !message.isEmpty())){
            Message m = new Message(u.getUno(),fno,message, LocalDateTime.now(),reponse,0);
            dao.save(m);
            //if(img!=null)img.write(uploadPath+"/"+getFileName(img));
        }
        res.sendRedirect(chemin+"?fno="+fno);
    }
    private String getFileName( Part part ) {
        for ( String content : part.getHeader( "content-disposition" ).split( ";" ) ) {
            if ( content.trim().startsWith( "filename" ) )
                return content.substring( content.indexOf( "=" ) + 2, content.length() - 1 );
        }
        return "Default.file";
    }
}
