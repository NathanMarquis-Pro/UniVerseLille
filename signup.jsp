<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
  <head>
    <meta charset="UTF-8" />
    <title>UniVerseLille</title>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <link href="npm/daisyui@5/theme/dark.css,npm/daisyui@5/theme/light.css" rel="stylesheet" type="text/css" />
    <!-- JS uniquement pour la persistance du thème entre les pages -->
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
  <body class="h-full w-full bg-base-300 fixed">
    <div class="w-full h-10 flex justify-between">
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
    </div>
    <div class="card w-[50%] bg-base-100 card-md shadow-sm m-auto mt-20">
        <div class="card-body">
            <h1 class="card-title text-4xl font-bold m-auto">Bienvenue sur UniVerseLille !</h1>
            <h2 class="text-2xl m-auto">Inscription</h2>
        <% String tentative = (String) session.getAttribute("tentative"); if(tentative!=null){ out.println(tentative); } %>

        <form class="card" action="Inscription" method="post">
        <div>
            <label class="input validator m-4">
                <input name="login" required placeholder="Login"/>
            </label>
        </div>

        <div class="flex w-full m-4">
            <label class="input validator mr-4">
                <input name="nom" required placeholder="Nom"/>
            </label>
            <label class="input validator ml-4">
                <input name="prenom" required placeholder="Prénom"/>
            </label>
        </div>

        <div>
            <label>
                <input type="date" class="m-4 input validator" name="d_naissance" placeholder="Date de naissance"/>
            </label>
        </div>
        <div class="mx-4 mt-4">
            <label>
                <input type="email" name="email" class="input validator my- 0" required placeholder="adressemail@gmail.com"/>
                <div class="validator-hint my-0">Entrez une adresse mail valide.</div>
            </label>
        </div>
        <div class="flex w-full m-4">
            <label class="input validator mr-4">
              <svg class="h-[1em] opacity-50" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><g stroke-linejoin="round" stroke-linecap="round" stroke-width="2.5" fill="none" stroke="currentColor"><path d="M2.586 17.414A2 2 0 0 0 2 18.828V21a1 1 0 0 0 1 1h3a1 1 0 0 0 1-1v-1a1 1 0 0 1 1-1h1a1 1 0 0 0 1-1v-1a1 1 0 0 1 1-1h.172a2 2 0 0 0 1.414-.586l.814-.814a6.5 6.5 0 1 0-4-4z"></path><circle cx="16.5" cy="7.5" r=".5" fill="currentColor"></circle></g></svg>
              <input name="mdp" type="password" required placeholder="Mot de passe"/>
            </label>
            <label class="input validator ml-4">
                <svg class="h-[1em] opacity-50" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><g stroke-linejoin="round" stroke-linecap="round" stroke-width="2.5" fill="none" stroke="currentColor"><path d="M2.586 17.414A2 2 0 0 0 2 18.828V21a1 1 0 0 0 1 1h3a1 1 0 0 0 1-1v-1a1 1 0 0 1 1-1h1a1 1 0 0 0 1-1v-1a1 1 0 0 1 1-1h.172a2 2 0 0 0 1.414-.586l.814-.814a6.5 6.5 0 1 0-4-4z"></path><circle cx="16.5" cy="7.5" r=".5" fill="currentColor"></circle></g></svg>
                <input name="mdp" type="password" required placeholder="Vérification mot de passe"/>
              </label>
          </div>
        <div class="justify-end card-actions m-4">
            <a class="btn" href="signin.jsp">Connexion</a>
            <input class="btn btn-primary" type="submit" value="Créer un compte" required />
        </div>
        </form>

    </div>
    </div>
  </body>
</html>
