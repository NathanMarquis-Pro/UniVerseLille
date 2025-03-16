<%@ page import="modeles.dao.FilDAOJdbc" %>
<%@ page import="java.util.List" %>
<%@ page import="modeles.dto.Fil" %>
<%@ page import="modeles.dto.Utilisateur" %>
<%@ page import="modeles.dto.Message" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<%!FilDAOJdbc daoFil = new FilDAOJdbc();%>
<%Utilisateur u = (Utilisateur) session.getAttribute("user");%>
<section class="fils">
    <%
    List<Fil> fils = daoFil.findAllForUtilisateur(u.getUno());
    for(Fil f : fils){ %>
      <div>
          <a href="./?fno=<%=f.getFno()%>"> <%=f.getTitre()%>></a>
      </div>
    <%
    }
    %>
</section>
<section class="messages">
    <%List<Message> messages = (List<Message>) request.getAttribute("messages");
    if(messages!=null) {
        for(Message m : messages){%>
        <div>
            <p>
            <%if(m.getReponse()!=0){
                Message mRep = m.getMessageReponse();%>
                <b> ==> <%=mRep.getUno()%></b> |
                    <%=mRep.getContenu()%> |
                <em><%=mRep.getD_ecriture().format(Message.CUSTOM_FORMATTER)%></em>
                <br>
            <%}%>
            <b><%=m.getUno()%></b> |
                <%=m.getContenu()%> |
                <em><%=m.getD_ecriture().format(Message.CUSTOM_FORMATTER)%></em>
                <div><%=m.getLikes()%> Likes</div>
            </p>
        </div>
        <%}
    }%>
    <div class="nouveau_message">
        <form action="./WEB-INF/NouveauMessage" method="POST">
            <label for="image">Choisir une image :</label><br>
            <input type="file" id="image" name="image" accept="image/*"><br><br>

            <label for="message">Message :</label><br>
            <textarea id="message" name="message" rows="5" cols="40" required></textarea><br><br>

            <button type="submit">Envoyer</button>
        </form>
    </div>
</section>
</body>
</html>