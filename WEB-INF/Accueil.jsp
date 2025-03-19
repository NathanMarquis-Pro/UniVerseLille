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
    <body class="h-full w-full bg-base fixed">
        <div class="w-full h-fit bg-base-200 flex justify-between">
            <div class="m-2">
                <div class="flex">
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
                    <a href="./?action=deconnexion">
                        <svg class="h-10 w-10 fill-current" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path d="M22 6.62219V17.245C22 18.3579 21.2857 19.4708 20.1633 19.8754L15.0612 21.7977C14.7551 21.8988 14.449 22 14.0408 22C13.5306 22 12.9184 21.7977 12.4082 21.4942C12.2041 21.2918 11.898 21.0895 11.7959 20.8871H7.91837C6.38776 20.8871 5.06122 19.6731 5.06122 18.0544V17.0427C5.06122 16.638 5.36735 16.2333 5.87755 16.2333C6.38776 16.2333 6.69388 16.5368 6.69388 17.0427V18.0544C6.69388 18.7626 7.30612 19.2684 7.91837 19.2684H11.2857V4.69997H7.91837C7.20408 4.69997 6.69388 5.20582 6.69388 5.91401V6.9257C6.69388 7.33038 6.38776 7.73506 5.87755 7.73506C5.36735 7.73506 5.06122 7.33038 5.06122 6.9257V5.91401C5.06122 4.39646 6.28572 3.08125 7.91837 3.08125H11.7959C12 2.87891 12.2041 2.67657 12.4082 2.47423C13.2245 1.96838 14.1429 1.86721 15.0612 2.17072L20.1633 4.09295C21.1837 4.39646 22 5.50933 22 6.62219Z"/>
                            <path d="M4.85714 14.8169C4.65306 14.8169 4.44898 14.7158 4.34694 14.6146L2.30612 12.5912C2.20408 12.49 2.20408 12.3889 2.10204 12.3889C2.10204 12.2877 2 12.1865 2 12.0854C2 11.9842 2 11.883 2.10204 11.7819C2.10204 11.6807 2.20408 11.5795 2.30612 11.5795L4.34694 9.55612C4.65306 9.25261 5.16327 9.25261 5.46939 9.55612C5.77551 9.85963 5.77551 10.3655 5.46939 10.669L4.7551 11.3772H8.93878C9.34694 11.3772 9.7551 11.6807 9.7551 12.1865C9.7551 12.6924 9.34694 12.7936 8.93878 12.7936H4.65306L5.36735 13.5017C5.67347 13.8052 5.67347 14.3111 5.36735 14.6146C5.26531 14.7158 5.06122 14.8169 4.85714 14.8169Z"/>
                            </svg>
                    </a>
                </div>
            </div>
            <div class="text-2xl font-bold h-full place-self-center">
                <h1>UniVerseLille</h1>
            </div>
            <%
                if(request.getParameter("fno") !=null ){%>
                        <label for="my-drawer-4" class="drawer-button btn btn-primary m-2">Participant</label>
                    <%} else {%>
                        <label for="my-drawer-4" class="opacity-0 drawer-button btn btn-primary m-2">Participant</label>
                <%}
            %>


        </div>
        <%Utilisateur u = (Utilisateur) session.getAttribute("user");%>
        <div class="flex h-full">
            <section class="fils w-[20vw] bg-base-200 px-2 overflow-x-hidden overflow-y-auto h-[69vh]">
                <%
                List<Fil> fils = (List<Fil>) request.getAttribute("fils");
                for(Fil f : fils){ %>
                    <a href="./?fno=<%=f.getFno()%>">
                        <%
                            if(request.getParameter("fno") !=null ){
                                if(f.getFno() == Integer.parseInt(request.getParameter("fno"))){%>
                                    <div class="my-2 p-2 rounded-box bg-primary text-primary-content">
                                <%} else {%>
                                    <div class="my-2 p-2 rounded-box bg-base-100 text-base-content hover:bg-base-300 hover:text-base-content">
                                <%}
                            } else {%>
                                <div class="my-2 p-2 rounded-box bg-base-100 text-base-content hover:bg-base-300 hover:text-base-content">
                            <%}
                        %>
                            <%=f.getTitre()%>
                        </div>
                    </a>
                <%
                }
                %>
                <div class="bg-base-300 fixed bottom-2 p-4 w-[19vw] rounded-box">
                    <form action="NouveauFil" method="post" class="flex flex-col">
                        <label for="titreFil">Quel est le thème de votre discussion ?</label>
                        <input id="titreFil" name="titreFil" type="text" required>
                        <br>
                        <button type="submit" class="btn btn-outline btn-primary">Créer</button>
                    </form>
                </div>

            </section>
            <section class="w-[80vw] flex flex-col overflow-x-hidden overflow-y-auto h-[80vh] p-4">
                <%List<Message> messages = (List<Message>) request.getAttribute("messages");
                Integer fno = (Integer) request.getAttribute("fno");
                if(fno==null)fno = 0;
                if(messages!=null && !messages.isEmpty()) {
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
                    <div class="fixed bottom-4 max-w-[78vw] w-full">
                        <form class="flex items-center gap-2 w-full" action="NouveauMessage" method="post">

                            <input type="hidden" name="fno" value="<%=fno%>">

                            <button type="button" class="btn btn-circle border-2 border-primary" onclick="uploadFileModal.showModal()" >🞥</button>

                            <textarea class="input flex-1 max-h-[200px] resize-none p-2 border-2 border-primary" id="message" name="message" required></textarea>

                            <button class="btn btn-primary btn-circle" type="submit">⮞</button>
                        </form>
                    </div>
                </div>
            </section>

            <div class="absolute drawer drawer-end">
                <input id="my-drawer-4" type="checkbox" class="drawer-toggle" />
                <div class="drawer-content">
                </div>
                <div class="drawer-side">
                  <label for="my-drawer-4" aria-label="close sidebar" class="drawer-overlay"></label>
                  <section class="participants menu bg-base-100 text-base-content min-h-full w-fit p-4 pr-6">
                    <h4 class="mx-auto mb-8 text-2xl font-bold">Participants</h4>
                    <%if(fno!=0){
                        List<Utilisateur> utilisateurs = (List<Utilisateur>) request.getAttribute("participants");
                        for(Utilisateur participant : utilisateurs){%>
                        <div class="bg-base-300 hover:bg-base-200 place-items-center p-2 rounded-box flex justify-between min-w-[40vh] my-1">
                            <p><%=participant.getPseudo()%></p>
                            <form action="AjouterParticipant" method = post>
                                <input type="hidden" name="action" value="remove">
                                <input type="hidden" name="fno" value="<%=fno%>">
                                <input type="hidden" name="uno" value="<%=participant.getUno()%>">
                                <button type="button" name="makeAdmin" value="" class="btn btn-warning btn-circle btn-xs">
                                    <svg class="h-4 w-4 fill-current" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M315.392 507.904c-81.92-40.96-137.216-122.88-137.216-221.184 0-135.168 110.592-245.76 245.76-245.76s245.76 110.592 245.76 245.76c0 133.12-104.448 241.664-237.568 245.76h-2.048c-202.752 0-368.64 165.888-368.64 368.64 0 12.288-8.192 20.48-20.48 20.48s-20.48-8.192-20.48-20.48c0-186.368 124.928-344.064 294.912-393.216z m108.544-16.384c112.64 0 204.8-92.16 204.8-204.8s-92.16-204.8-204.8-204.8-204.8 92.16-204.8 204.8 92.16 204.8 204.8 204.8z m561.152 135.168l4.096 10.24-49.152 59.392c-8.192 10.24-8.192 26.624 0 36.864l49.152 57.344-4.096 10.24c-10.24 28.672-24.576 57.344-45.056 79.872l-8.192 8.192-75.776-12.288c-12.288-2.048-26.624 6.144-30.72 18.432l-26.624 73.728-10.24 2.048c-38.912 8.192-77.824 8.192-116.736 0l-12.288-2.048-24.576-71.68c-4.096-12.288-18.432-20.48-30.72-18.432l-77.824 12.288-8.192-8.192c-10.24-10.24-18.432-22.528-24.576-34.816-8.192-14.336-16.384-30.72-20.48-47.104l-4.096-10.24 51.2-57.344c8.192-10.24 8.192-26.624 0-34.816l-49.152-59.392 4.096-10.24c10.24-30.72 26.624-57.344 47.104-81.92l8.192-8.192 73.728 12.288c12.288 2.048 26.624-6.144 32.768-18.432l26.624-71.68 10.24-2.048c36.864-8.192 75.776-8.192 114.688 0l12.288 2.048 24.576 69.632c4.096 12.288 18.432 22.528 32.768 20.48l75.776-10.24 8.192 8.192c10.24 12.288 18.432 22.528 24.576 36.864 6.144 10.24 12.288 26.624 18.432 40.96z m-57.344-24.576c-4.096-8.192-8.192-14.336-14.336-22.528l-53.248 6.144c-32.768 4.096-65.536-16.384-75.776-47.104L768 491.52c-24.576-4.096-49.152-4.096-73.728 0l-18.432 49.152c-10.24 30.72-45.056 51.2-77.824 45.056l-51.2-8.192c-12.288 14.336-20.48 32.768-28.672 49.152l34.816 40.96c20.48 24.576 20.48 63.488 0 88.064l-34.816 40.96c4.096 10.24 8.192 18.432 14.336 28.672 4.096 8.192 8.192 14.336 14.336 20.48l55.296-8.192c32.768-4.096 65.536 16.384 75.776 47.104l16.384 49.152c24.576 4.096 51.2 4.096 75.776 0l18.432-51.2c10.24-30.72 45.056-51.2 75.776-45.056l51.2 8.192c10.24-14.336 20.48-30.72 26.624-49.152l-32.768-38.912c-20.48-24.576-22.528-63.488-2.048-88.064l34.816-40.96c-4.096-8.192-8.192-16.384-14.336-26.624z m-196.608 204.8c-51.2 0-92.16-40.96-92.16-92.16s40.96-92.16 92.16-92.16 92.16 40.96 92.16 92.16-43.008 92.16-92.16 92.16z m0-40.96c28.672 0 51.2-22.528 51.2-51.2s-22.528-51.2-51.2-51.2-51.2 22.528-51.2 51.2 22.528 51.2 51.2 51.2z"  />
                                    </svg>
                                </button>
                                <button type="submit" class="btn btn-error btn-circle btn-xs">🞭</button>
                            </form>
                        </div>
                        <%}%>
                        <div class="bg-base-300 fixed bottom-2 p-4 w-[40vh] rounded-box">
                            <form action="AjouterParticipant" method="post" class="flex flex-col">
                                <input type="hidden" name="action" value="add">
                                <input type="hidden" name="fno" value="<%=fno%>">
                                <label for="pseudoParticipant">Ajouter un participant :</label><br>
                                <input id="pseudoParticipant" name="pseudoParticipant" type="text" required class="input validator"><br><br>
                                <button type="submit" class="btn btn-info justify-self-end">Ajouter</button>
                            </form>
                        </div>
                    <%}%>
                    </section>
                </div>
              </div>
        </div>

    </body>
</html>