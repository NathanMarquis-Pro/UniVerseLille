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
    <body class="h-full w-full bg-base fixed">
        <div class="w-full h-fit bg-base-200 flex justify-between">
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
        <div class="flex h-full">
            <section class="fils w-[20vw] bg-base-300 px-2">
                <%
                List<Fil> fils = daoFil.findAllForUtilisateur(u.getUno());
                for(Fil f : fils){ %>
                    <a href="./?fno=<%=f.getFno()%>">
                        <%
                            if(request.getParameter("fno") !=null ){
                                if(f.getFno() == Integer.parseInt(request.getParameter("fno"))){%>
                                    <div class="my-2 p-2 rounded-box bg-info text-info-content hover:bg-primary hover:text-primary-content">
                                <%} else {%>
                                    <div class="my-2 p-2 rounded-box bg-base-100 hover:bg-primary hover:text-primary-content">
                                <%}
                            } else {%>
                                <div class="my-2 p-2 rounded-box bg-base-100 hover:bg-primary hover:text-primary-content">
                            <%}
                        %>
                            <%=f.getTitre()%>
                        </div>
                    </a>
                <%
                }
                %>
                <a href="./?action=nouveauFil"></a>
            </section>
            <section class="w-[80vw] flex flex-col overflow-x-hidden overflow-y-auto h-[calc(100vh-100px)] p-4">
                <%List<Message> messages = (List<Message>) request.getAttribute("messages");
                int fno = 0;
                if(messages!=null) {
                    fno = messages.get(0).getFno();
                    for(Message m : messages){%>
                        <%
                            if(m.getUno() == u.getUno()){%>
                                <div class="chat chat-end">
                            <%} else {%>
                                <div class="chat chat-start">
                            <%}
                        %>
                        <div class="chat-header">
                            <div class="text-base">
                                <b><%=m.getPseudo()%></b>
                            </div>
                            <div class="tooltip" data-tip="<%=m.getD_ecriture().format(Message.DATE_FORMATER_FULL)%>">
                                <em><%=m.getD_ecriture().format(Message.CUSTOM_FORMATTER2)%></em>
                            </div>
                        </div>
                        <div class="chat-bubble">
                            <%if(m.getReponse()!=0){
                                Message mRep = m.getMessageReponse();%>
                                <b> ⤿ <%=mRep.getPseudo()%></b> |
                                    <%=mRep.getContenu()%> |
                                <em><%=mRep.getD_ecriture().format(Message.CUSTOM_FORMATTER2)%></em>
                                <br>
                            <%}%>
                            <%=m.getContenu()%>
                        </div>
                        <button class="btn btn-xs chat-footer m-1">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2.5" stroke="currentColor" class="size-[1.2em]"><path stroke-linecap="round" stroke-linejoin="round" d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12Z" /></svg>
                            <%=m.getLikes()%>
                        </button>
                    </div>
                    <%}
                }%>

                <dialog id="uploadFileModal" class="modal">
                    <div class="modal-box w-fit">
                        <h3 class="text-lg font-bold m-auto mb-8">Upload un fichier :</h3>
                        <input class="file-input" type="file" id="image" name="image" accept="image/*">
                        <div class="modal-action">
                            <button class="btn btn-error mt-4" onclick="uploadFileModal.close();">Fermer</button>
                        </div>
                    </div>
                </dialog>
                <%
                            if(request.getParameter("fno") == null ){%>
                                <div class="hidden">
                            <%} else {%>
                                <div>
                            <%}%>
                    <div class="fixed bottom-4 max-w-[calc(100vw-360px)] w-full">
                        <form class="flex items-center gap-2 w-full" action="NouveauMessage" method="post">
                
                            <input type="hidden" name="fno" value="<%=fno%>">
                
                            <button type="button" class="btn btn-circle border-2 border-primary" onclick="uploadFileModal.showModal()" >🞥</button>
                
                            <textarea class="input flex-1 max-h-[200px] resize-none p-2 border-2 border-primary" id="message" name="message" required></textarea>
                
                            <button class="btn btn-primary btn-circle" type="submit">⮞</button>
                        </form>
                    </div>
                </div>
            </section>
        </div>
    </body>
</html>