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
                <div class="contentHead">Bruchwaren</div>
                <div class="contentButtonPane <c:if test="${!authorized}">hidden</c:if>">
                        <button class="contentButton" onclick="openItemModal()">
                            Hinzufügen
                        </button>
                        <button class="contentButton">
                            Löschen
                        </button>
                    </div>
                    <div class="contentEntryPane">
                    <c:forEach var="brokenProduct" items="${brokenProducts}">
                        <div class="contentEntry">
                            <p class="entryContent">
                                ${brokenProduct}
                            </p>
                        </div>
                    </c:forEach>
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
                            <form method="POST" action="JetCheckController" name="passwordInput">
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
                                Neue Bruchware
                            </div>
                            <span class="close" onclick="closeItemModal()">&#10005</span>
                    </div>
                    <div class="modalValue">
                        <center>
                                <form method="POST" action="JetCheckController" name="newBrokenProduct">
                                <div class="inputForm">
                                    <input class="inputField" type="text" name="brokenproductname" placeholder="Warenname"> <!-- cant have the name "productname" bc that fucks the doPost() -->
                                    <br><br>
                                    <input class="inputField" type="date" name="date" placeholder="Datum">
                                    <br><br>
                                    <input class="inputField" type="number" name="quantity" placeholder="Menge">
                                    <br>
                                    <label class="formError"><c:if test="${insertError}">Ware existiert bereits</c:if></label>
                                </div>
                                <div class="modalButtons">
                                    <button class="confirmButton" onclick="submit()">OK</button>
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
