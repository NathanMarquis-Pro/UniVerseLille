<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>UniVerseLille</title>
</head>
<body>
<h1>Bienvenue sur UniVerseLille !</h1>

<h2>Inscription</h2>
<%
    String tentative = request.getParameter("tentative");
    if(tentative!=null && Integer.parseInt(tentative)==1){
        out.println("<h3>Mot de passe ou nom d'utilisateur incorrect</h3>");
    }
%>

<form action="Inscription" method="post" >
    <div>
    <label>Login
        <input name="login">
    </label>
    </div>

    <div>
    <label>Nom
            <input name="nom">
    </label>
    </div>

    <div>
    <label>Prénom
            <input name="prenom">
        </label>
    </div>

    <div>
    <label>Date de naissance
        <input name="d_naissance">
    </label>
    </div>
    <div>
    <label>Adresse Mail
            <input name="email">
    </label>
    </div>
    <div>
    <label>Mot de passe
        <input name="mdp" type="password">
    </label>
    </div>
    <div>
    <label>Vérification mot de passe
            <input name="mdpVerif" type="password">
    </label>
    </div>
    <div>
    <input type="submit" value="Créer un compte">
    </div>
</form>

<a href="login.jsp">Connexion</a>
</body>
</html>