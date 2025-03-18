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
<%Utilisateur u = (Utilisateur) session.getAttribute("user");%>
<a href="./?action=deconnexion">Déconnexion</a>
<section class="fils">
    <%
    List<Fil> fils = (List<Fil>) request.getAttribute("fils");
    for(Fil f : fils){ %>
      <div>
          <a href="./?fno=<%=f.getFno()%>"> <%=f.getTitre()%></a>
      </div>
    <%
    }
    %>
    <div>
        <form action="NouveauFil" method="post">
            <label for="titreFil">Quel est le thème de votre discussion ?</label><br>
            <input id="titreFil" name="titreFil" type="text" required><br><br>
            <button type="submit">Créer</button>
        </form>
    </div>
</section>
<section class="messages">
    <%List<Message> messages = (List<Message>) request.getAttribute("messages");
    Integer fno = (Integer) request.getAttribute("fno");
    if(fno==null)fno = 0;
    if(messages!=null && !messages.isEmpty()) {
        for(Message m : messages){%>
        <div>
            <p>
            <%if(m.getReponse()!=0){
                Message mRep = m.getMessageReponse();%>
                <b> ==> <%=mRep.getPseudo()%></b> |
                    <%=mRep.getContenu()%> |
                <em><%=mRep.getD_ecriture().format(Message.CUSTOM_FORMATTER)%></em>
                <br>
            <%}%>
            <b><%=m.getPseudo()%></b> |
                <%=m.getContenu()%> |
                <em><%=m.getD_ecriture().format(Message.CUSTOM_FORMATTER)%></em>
                <div><%=m.getLikes()%> Likes</div>
            </p>
        </div>
        <%}
    }%>
    <div class="nouveau_message">
        <form action="NouveauMessage" method="post">

            <input type="hidden" name="fno" value="<%=fno%>">

            <label for="image">Choisir une image :</label><br>
            <input type="file" id="image" name="image" accept="image/*"><br><br>

            <label for="message">Message :</label><br>
            <textarea id="message" name="message" rows="5" cols="40" required></textarea><br><br>

            <button type="submit">Envoyer</button>
        </form>
    </div>
</section>
<section class="participants">
    <%if(fno!=0){
        List<Utilisateur> utilisateurs = (List<Utilisateur>) request.getAttribute("participants");
        for(Utilisateur participant : utilisateurs){%>
        <div>
            <%=participant.getPseudo()%>
            <form action="AjouterParticipant" method = post>
                <input type="hidden" name="action" value="remove">
                <input type="hidden" name="fno" value="<%=fno%>">
                <input type="hidden" name="uno" value="<%=participant.getUno()%>">
                <button type="submit">Supprimer</button>
            </form>
        </div>
        <%}%>
    <div>
            <form action="AjouterParticipant" method="post">
                <input type="hidden" name="action" value="add">
                <input type="hidden" name="fno" value="<%=fno%>">
                <label for="pseudoParticipant">Ajouter un participant :</label><br>
                <input id="pseudoParticipant" name="pseudoParticipant" type="text" required><br><br>
                <button type="submit">Ajouter</button>
            </form>
    </div>
    <%}%>

</section>
</body>
</html>