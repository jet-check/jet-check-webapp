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
                <div class="contentHead">Gebäckentnahme</div>
                <div class="contentButtonPane">
                    <button class="contentButton" onclick="openModal('itemModal')">
                        Hinzufügen
                    </button>
                    <button class="contentButton <c:if test="${!authorized}">hidden</c:if>" onclick="openModal('deleteEntryModal')">
                        Löschen
                    </button>
                </div>
                <div class="contentEntryPane">
                    <form method="POST" action="JetCheckController">
                    <c:forEach var="entnahme" items="${entnahmen}">
                            <div class="contentEntry">
                                <div class="entryContent">
                                    <table style="width: 100%">
                                        <tr>
                                            <td class="cbCell <c:if test="${!authorized}">hidden</c:if>">
                                                <input type="checkbox" name="cb_${entnahme}">
                                            </td>
                                            <td class="nameCell">
                                                ${entnahme.getGebaeckname()}
                                            </td>
                                            <td class="col1Cell">
                                                ${entnahme.getAnzahl()}
                                            </td>
                                            <td class="col4Cell">
                                                ${entnahme.getDate()}
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </c:forEach>

                        <div id="deleteEntryModal" class="modal">
                            <div class="modal-content">
                                <div class="modalHeader">
                                    <div class="headerContent">
                                        Neue Ware
                                    </div>
                                    <span class="close" onclick="closeModal('deleteEntryModal')">&#10005</span>
                                </div>
                                <div class="modalValue">
                                    <center>
                                        <h3>
                                            Möchten Sie die ausgewählten Waren wirklich löschen?<br>
                                            Diese Aktion kann nicht rückgängig gemacht werden
                                        </h3>
                                        <div class="modalButtons">
                                            <button class="confirmButton" onclick="submit()" name="deleteWaren">OK</button>
                                            <button type="button" class="cancelButton" onclick="closeModal('deleteWarenModal')">Abbrechen</button>
                                        </div>
                                        <input type="hidden" name="GebaeckEntnahmen">

                                    </center>

                                </div>
                            </div>                  
                        </div>

                    </form>

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
                            <input type="hidden" name="GebackEntnahmen">
                        </c:when>
                        <c:otherwise>
                            <input type="hidden" name="GebäckSubmenu">
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
                                    <button type="button" class="cancelButton" onclick="closeModal('pwModal')">Abbrechen</button>
                                </div>
                                <input type="hidden" name="GebaeckEntnahmen">
                            </form>
                        </center>
                    </div>
                </div>
            </div>

            <div id="itemModal" class="modal">
                <div class="modal-content">
                    <div class="modalHeader">
                        <div class="headerContent">
                            Neue Entnahme
                        </div>
                        <span class="close" onclick="closeModal('itemModal')">&#10005</span>
                    </div>
                    <div class="modalValue">
                        <center>
                            <form method="POST" action="JetCheckController" name="newEntnahme">
                                <div class="inputForm">
                                    <Select class="inputField" name="gebaeckEntnahmeName">
                                        <c:forEach var="backware" items="${gebaeck}">
                                            <option>${backware}</option>
                                        </c:forEach>
                                    </Select>
                                    <br><br>
                                    <input class="inputField" type="number" name="anzahl" placeholder="Anzahl">
                                    <br><br>
                                    <input class="inputField" type="date" name="date" data-date-format="DD MM YYYY" placeholder="Entahme-Datum">
                                </div>
                                <div class="modalButtons">
                                    <button class="confirmButton" onclick="submit()" name="gebaeckEntnahme">OK</button>
                                    <button type="button" class="cancelButton" onclick="closeModal('itemModal')">Abbrechen</button>
                                </div>
                                <input type="hidden" name="GebaeckEntnahmen">
                            </form>
                        </center>

                    </div>
                </div>                  
            </div>
            <script src="src/modal.js" type="text/javascript"></script>
    </body>
</html>

