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
    <body>
        <nav id="mySidenav" class="sidenav">

            <img class="navPicture" src="src/logo.png" alt="Jet-Check Logo" >

            <div class="navEntry">
                <a href="#">Waren</a>
            </div>
            <div class="navEntry">
                <a href="#">Information</a>
            </div>
            <div class="navEntry">
                <a href="#">Gebäck</a>
            </div>

            <footer class="navFooter"></footer>
        </nav>
        <div class="content">
            <div class="contentPane">
                <div class="contentHead">Waren</div>
                <div class="contentButtonPane <c:if test="${!authorized}">hidden</c:if>">
                        <button class="contentButton" onclick="openItemModal()">
                            Hinzufügen
                        </button>
                        <button class="contentButton">
                            Löschen
                        </button>
                    </div>
                    <div class="contentEntryPane">
                        <div class="contentEntry">
                            <p class="entryContent">
                                Ware 1
                            </p>
                        </div>
                        <div class="contentEntry">
                            <p class="entryContent">
                                Ware 2
                            </p>
                        </div>
                        <div class="contentEntry">
                            <p class="entryContent">
                                Ware 3
                            </p>
                        </div>
                        <div class="contentEntry">
                            <p class="entryContent">
                                Ware 4
                            </p>
                        </div>
                    </div>  
                </div>
                <div class="buttonPane">
                    <button class="buttonBackCancel button" name="backcancel">
                    <c:choose>
                        <c:when test="${authorized}">
                            Abbrechen
                        </c:when>
                        <c:otherwise>
                            Zurück
                        </c:otherwise>
                    </c:choose>
                </button>
                <button class="buttonEditAck button" name="editack"  onclick="<c:if test="${!authorized}">openPWModal()</c:if>">
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
            <!-- The Modal -->
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
                            <form method="POST" name="passwordInput">
                                <div class="inputForm">

                                    <input class="inputField" type="password" name="password" placeholder="Passwort">
                                    <br>
                                    <label class="formError"><c:if test="${wrongPassword}">Falsches Passwort</c:if></label>                            

                                    </div>
                                    <div class="modalButtons">
                                        <button class="confirmButton" onclick="submit()">OK</button>
                                        <button class="cancelButton" onclick="closePWModal()">Abbrechen</button>
                                    </div>
                                </form>
                            </center>
                        </div>
                    </div>
                </div>
                <div id="itemModal" class="modal">
                    <div class="modal-content">
                        <div class="modalHeader">
                            <div class="headerContent">
                                Neue Ware
                            </div>
                            <span class="close" onclick="closeItemModal()">&#10005</span>
                        </div>
                        <div class="modalValue">
                            <center>
                                <form method="POST" name="newProduct">
                                    <div class="inputForm">

                                        <input class="inputField" type="text" name="productname" placeholder="Warenname">
                                        <br>
                                        <label class="formError"><c:if test="${itemNameMissing}">Warennamen eingeben</c:if></label>

                                </div>
                                <div class="modalButtons">
                                    <button class="confirmButton">OK</button>
                                    <button class="cancelButton" onclick="closeItemModal()">Abbrechen</button>
                                </div>
                            </form>
                        </center>

                    </div>
                </div>                  
            </div>
            <script src="src/modal.js" type="text/javascript"></script>
    </body>
</html>
