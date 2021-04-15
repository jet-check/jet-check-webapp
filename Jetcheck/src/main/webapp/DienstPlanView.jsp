<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="src/app.css" rel="stylesheet" type="text/css"/>
        <title>JET-Check</title>
    </head>
    <body data-authorization="${authorized}">
        <nav id="mySidenav" class="sidenav">

            <img class="navPicture" src="src/logo.png" alt="Jet-Check Logo" >
            <div class="navItemContainer">
                <div class="navEntry">
                    <form method="POST" action="JetCheckController">
                        <input class="navButton" type="submit" name="waresubmenu" value="Waren">
                    </form>
                </div>

            </div>
            <div class="navItemContainer">
                <div class="navEntry">
                    <form method="POST" action="JetCheckController">
                        <input class="navButton" type="submit" name="gebäcksubmenu" value="Gebäck">
                    </form>
                </div>    
            </div>    
            <div class="navItemContainer">
                <div class="navEntry">
                    <form method="POST" action="JetCheckController">
                        <input class="navButton" type="submit" name="infosubmenu" value="Informationen">
                    </form>
                </div>    
            </div>
            <footer class="navFooter"></footer>
        </nav>

        <div class="content">
            <div class="contentPane">
                <div class="contentHead">Dienstplan</div>
                <div class="contentButtonPane <c:if test="${!authorized}">hidden</c:if>">
                        <button class="contentButton" onclick="openModal('fileModal')">
                            Dienstplan hochladen
                        </button>
                    </div>
                    <div class="contentEntryPane filePane">
                        <center>
                            <iframe class="fileView" src="https://drive.google.com/file/d/1J11Cyy39rC-fV0I7gnvOpiFkU0QPQt_D/preview"></iframe>
                        </center>

                    </div>  
                </div>
                <div class="buttonPane">
                    <form method="POST" action="JetCheckController" style="height: 2.9em">
                        <button class="button buttonBackCancel" name="cancel">
                        <c:choose>
                            <c:when test="${authorized}">Abbrechen</c:when>
                            <c:otherwise>Zurück</c:otherwise>
                        </c:choose>
                    </button>
                    <c:choose>
                        <c:when test="${authorized}">
                            <input type="hidden" name="warenliste">
                        </c:when>
                        <c:otherwise>
                            <input type="hidden" name="waresubmenu">
                        </c:otherwise>
                    </c:choose>


                </form>
                <button class="buttonEditAck button" name="editack"  onclick="<c:if test="${!authorized}">openModal('pwModal')</c:if>">
                    <c:choose>
                        <c:when test="${authorized}">
                            Fertig
                        </c:when>
                        <c:otherwise>
                            Bearbeiten
                        </c:otherwise>
                    </c:choose>
                </button>
            </div>
                    
            <div id="pwModal" class="modal">
                <!-- Modal content -->
                <div class="modal-content">
                    <div class="modalHeader">
                        <div class="headerContent">
                            Passwort eingeben
                        </div>
                        <span class="close" onclick="closePWModal()">&#10005</span>
                    </div>
                    <div class="modalValue">
                        <center>
                            <form method="POST" action="JetCheckController" name="passwordInput">
                                <div class="inputForm">

                                    <input class="inputField" type="password" name="password" placeholder="Passwort">
                                    <br>
                                    <label class="formError"><c:if test="${wrongPassword}">Falsches Passwort</c:if></label>                            

                                    </div>
                                    <div class="modalButtons">
                                        <button class="confirmButton" onclick="submit()">OK</button>
                                        <button type="button" class="cancelButton" onclick="closeModal('pwModal')">Abbrechen</button>
                                    </div>
                                    <input type="hidden" name="dienstplan">
                                </form>
                            </center>
                        </div>
                    </div>
                </div>

                <div id="fileModal" class="modal">
                    <div class="modal-content">
                        <div class="modalHeader">
                            <div class="headerContent">
                                Dienstplan auswählen
                            </div>
                            <span class="close" onclick="closeModal('fileModal')">&#10005</span>
                        </div>
                        <div class="modalValue">
                            <center>
                                <form method="POST" action="JetCheckController" name="newProduct">
                                    <div class="inputForm">
                                        <label>Bitte .pdf Datei auswählen</label>
                                        <div class="inputField">
                                            <input class="fileInput" type="file" name="dienstplanFile" placeholder="Warenname">
                                        </div>
                                        
                                </div>
                                <div class="modalButtons">
                                    <button class="confirmButton" onclick="submit()">OK</button>
                                    <button type="button" class="cancelButton" onclick="closeModal('fileModal')">Abbrechen</button>
                                </div>
                                <input type="hidden" name="dienstplan">
                            </form>
                        </center>
                    </div>
                </div>                  
            </div>
            <script src="src/modal.js" type="text/javascript"></script>
        </div>
    </body>
</html>
