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
                <div class="contentHead">Sonderaufgaben</div>
                <div class="contentButtonPane">
                    <button class="contentButton" onclick="openModal('itemModal')">
                        Hinzufügen
                    </button>
                    <button class="contentButton  <c:if test="${!authorized}">hidden</c:if>" onclick="openModal('deleteWarenModal')">
                            Löschen 
                        </button>
                    </div>
                    <div class="contentEntryPane">
                    <c:forEach var="task" items="${Sonderaufgaben}">
                        <div class="contentEntry">
                            <div class="entryContent">
                                <form>
                                 
                                    <table style="width: 100%">
                                        <tr>
                                            <td class="cbCell <c:if test="${!authorized}">hidden</c:if>">
                                                <input type="checkbox" name="cb_${task.id}">
                                            </td>
                                            <td class="col1Cell">
                                                ${task.name}
                                            </td>
                                            <td class="col2Cell">
                                                ${task.beschreibung}
                                            </td>
                                            <td class="col3Cell">
                                                ${task.mitarbeiter}
                                            </td>
                                            <td class="col4Cell">
                                                ${task.getDatum()}
                                            </td>
                                        </tr>
                                    </table>
                                            
                                    <div id="deleteModal" class="modal">
                                        <div class="modal-content">
                                            <div class="modalHeader">
                                                <div class="headerContent">
                                                    Neue Ware
                                                </div>
                                                <span class="close" onclick="closeModal('deleteModal')">&#10005</span>
                                            </div>
                                            <div class="modalValue">
                                                <center>
                                                    <h3>not yet implemented
                                                    </h3>
                                                    <div class="modalButtons">
                                                        <button class="confirmButton" onclick="submit()" name="deleteTasks">OK</button>
                                                        <button type="button" class="cancelButton" onclick="closeModal('deleteModal')">Abbrechen</button>
                                                    </div>
                                                    <input type="hidden" name="sonderaufgaben">
                                                </center>

                                            </div>
                                        </div>                  
                                    </div>   

                                </form>

                            </div>
                        </div>
                    </c:forEach>

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
                            <input type="hidden" name="sonderaufgaben">
                        </c:when>
                        <c:otherwise>
                            <input type="hidden" name="infosubmenu">
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
                                    <input type="hidden" name="sonderaufgaben">
                                </form>
                            </center>
                        </div>
                    </div>
                </div>
                <div id="itemModal" class="modal">
                    <div class="modal-content">
                        <div class="modalHeader">
                            <div class="headerContent">
                                Sonderaufgabe eintragen
                            </div>
                            <span class="close" onclick="closeModal('itemModal')">&#10005</span>
                        </div>
                        <div class="modalValue">
                            <center>
                                <form method="POST" action="JetCheckController" name="newSpecial">
                                    <div class="inputForm">
                                        <input type="text" class="inputField" name="employeeName" placeholder="Ihr Name">
                                        <br><br>
                                        <input type="date" class="inputField" name="date" data-date-format="DD MM YYYY" placeholder="Datum"> 
                                        <br><br>
                                        <input class="inputField" type="text" name="specialTask" placeholder="Aufgabe">
                                        <br><br>
                                        <input class="inputField descField" type="text" name="description" placeholder="kurze Beschreibung">
                                        <br>
                                        <label class="formError"><c:if test="${insertError}">Fehler aufgetreten</c:if></label>
                                </div>
                                <div class="modalButtons">
                                    <button class="confirmButton" onclick="submit()">OK</button>
                                    <button type="button" class="cancelButton" onclick="closeModal('itemModal')">Abbrechen</button>
                                </div>
                                <input type="hidden" name="sonderaufgaben">
                            </form>
                        </center>

                    </div>
                </div>                  
            </div>
            <script src="src/modal.js" type="text/javascript"></script>
    </body>
</html>
