<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>UniVerseLille</title>
</head>
<body>
<h1>Bienvenue sur UniVerseLille !</h1>

<%
    String tentative = request.getParameter("tentative");
    if(tentative!=null && Integer.parseInt(tentative)==1){
        out.println("<h2>Mot de passe ou nom d'utilisateur incorrect</h2>");
    }
%>

<form action="Connexion" method="post" >
    <label>Login
        <input name="login">
    </label>
    <label>Mot de passe
        <input name="mdp" type="password">
    </label>
    <input type=submit>
</form>
</body>
</html>