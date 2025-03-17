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
    <link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <link href="npm/daisyui@5/theme/dark.css,npm/daisyui@5/theme/light.css" rel="stylesheet" type="text/css" />
    <!-- JS uniquement pour la gestion du thème-->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
          const savedTheme = localStorage.getItem("theme") || "light";
          document.documentElement.setAttribute("data-theme", savedTheme);
          const themeToggle = document.querySelector(".theme-controller");
          if (savedTheme === "dark") {
            themeToggle.checked = true;
          }
          themeToggle.addEventListener("change", function () {
            const newTheme = themeToggle.checked ? "dark" : "light";
            document.documentElement.setAttribute("data-theme", newTheme);
            localStorage.setItem("theme", newTheme);
          });
        });
      </script>
</head>
<body class="h-full w-full bg-base fixed">
    <div class="w-full h-fit bg-base-300 flex justify-between">
        <div class="m-2">
            <label class="swap swap-rotate">
                <input type="checkbox" class="theme-controller" value="dark" />
                <svg
                  class="swap-off h-10 w-10 fill-current"
                  xmlns="http://www.w3.org/2000/svg"
                  viewBox="0 0 24 24">
                  <path
                    d="M5.64,17l-.71.71a1,1,0,0,0,0,1.41,1,1,0,0,0,1.41,0l.71-.71A1,1,0,0,0,5.64,17ZM5,12a1,1,0,0,0-1-1H3a1,1,0,0,0,0,2H4A1,1,0,0,0,5,12Zm7-7a1,1,0,0,0,1-1V3a1,1,0,0,0-2,0V4A1,1,0,0,0,12,5ZM5.64,7.05a1,1,0,0,0,.7.29,1,1,0,0,0,.71-.29,1,1,0,0,0,0-1.41l-.71-.71A1,1,0,0,0,4.93,6.34Zm12,.29a1,1,0,0,0,.7-.29l.71-.71a1,1,0,1,0-1.41-1.41L17,5.64a1,1,0,0,0,0,1.41A1,1,0,0,0,17.66,7.34ZM21,11H20a1,1,0,0,0,0,2h1a1,1,0,0,0,0-2Zm-9,8a1,1,0,0,0-1,1v1a1,1,0,0,0,2,0V20A1,1,0,0,0,12,19ZM18.36,17A1,1,0,0,0,17,18.36l.71.71a1,1,0,0,0,1.41,0,1,1,0,0,0,0-1.41ZM12,6.5A5.5,5.5,0,1,0,17.5,12,5.51,5.51,0,0,0,12,6.5Zm0,9A3.5,3.5,0,1,1,15.5,12,3.5,3.5,0,0,1,12,15.5Z" />
                </svg>
                <svg
                  class="swap-on h-10 w-10 fill-current"
                  xmlns="http://www.w3.org/2000/svg"
                  viewBox="0 0 24 24">
                  <path
                    d="M21.64,13a1,1,0,0,0-1.05-.14,8.05,8.05,0,0,1-3.37.73A8.15,8.15,0,0,1,9.08,5.49a8.59,8.59,0,0,1,.25-2A1,1,0,0,0,8,2.36,10.14,10.14,0,1,0,22,14.05,1,1,0,0,0,21.64,13Zm-9.5,6.69A8.14,8.14,0,0,1,7.08,5.22v.27A10.15,10.15,0,0,0,17.22,15.63a9.79,9.79,0,0,0,2.1-.22A8.11,8.11,0,0,1,12.14,19.73Z" />
                </svg>
              </label>
        </div>
        <div class="text-2xl font-bold h-full place-self-center">
            <h1>UniVerseLille</h1>
        </div>
        <a class="btn m-2">Participants</a>
    </div>
<%!FilDAOJdbc daoFil = new FilDAOJdbc();%>
<%Utilisateur u = (Utilisateur) session.getAttribute("user");%>
<div class="join">
    <section class="fils">
        <%
        List<Fil> fils = daoFil.findAllForUtilisateur(u.getUno());
        for(Fil f : fils){ %>
          <div class="bg-red-300">
              <a href="./?fno=<%=f.getFno()%>"> <%=f.getTitre()%>></a>
          </div>
        <%
        }
        %>
        <a href="./?action=nouveauFil"></a>
    </section>
    <section class="messages">
        <%List<Message> messages = (List<Message>) request.getAttribute("messages");
        int fno = 0;
        if(messages!=null) {
            fno = messages.get(0).getFno();
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
                <input class="file-input" type="file" id="image" name="image" accept="image/*"><br><br>
    
                <label for="message">Message :</label><br>
                <textarea id="message" name="message" rows="5" cols="40" required></textarea><br><br>
    
                <button class="btn btn-primary" type="submit">Envoyer</button>
            </form>
        </div>
    </section>
</div>

</body>
</html>