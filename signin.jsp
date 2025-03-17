<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>UniVerseLille</title>
</head>
<body>
<h1>Bienvenue sur UniVerseLille !</h1>

<h2>Connexion</h2>
<%
    String tentative = request.getParameter("tentative");
    if(tentative!=null && Integer.parseInt(tentative)==1){
        out.println("<h4>Mot de passe ou nom d'utilisateur incorrect</h4>");
    }
%>

<form action="Connexion" method="post" >
    <div>
    <label>Login
        <input name="login" required>
    </label>
    </div>
    <div>
    <label>Mot de passe
        <input name="mdp" type="password" required>
    </label>
    </div>
    <div>
    <input type="submit" value="Se connecter">
    </div>
</form>

<a href="signup.jsp">Créer un compte</a>
</body>
</html>