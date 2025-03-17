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
    String tentative = (String) session.getAttribute("tentative");
    if(tentative!=null){
        out.println(tentative);
    }
%>

<form action="Inscription" method="post" >
    <div>
    <label>Login
        <input name="login" required>
    </label>
    </div>

    <div>
    <label>Nom
            <input name="nom" required>
    </label>
    </div>

    <div>
    <label>Prénom
            <input name="prenom" required>
        </label>
    </div>

    <div>
    <label>Date de naissance
        <input name="d_naissance">
    </label>
    </div>
    <div>
    <label>Adresse Mail
            <input name="email" required>
    </label>
    </div>
    <div>
    <label>Mot de passe
        <input name="mdp" type="password" required>
    </label>
    </div>
    <div>
    <label>Vérification mot de passe
            <input name="mdpVerif" type="password" required>
    </label>
    </div>
    <div>
    <input type="submit" value="Créer un compte" required>
    </div>
</form>

<a href="signin.jsp">Connexion</a>
</body>
</html>