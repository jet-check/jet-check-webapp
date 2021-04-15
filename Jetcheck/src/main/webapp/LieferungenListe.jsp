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
                <div class="contentHead">Lieferungen</div>
                <div class="contentButtonPane <c:if test="${!authorized}">hidden</c:if>">
                        <button class="contentButton" onclick="openModal('itemModal')">
                            Hinzufügen
                        </button>
                        <button class="contentButton" onclick="openModal('deleteLieferungenModal')">
                            Löschen
                        </button>
                    </div>
                    <div class="contentEntryPane">
                        <form method="POST" action="JetCheckController">
                            <div class="contentEntry">
                                <div class="entryContent">
                                    <table>
                                        <tr>
                                            <td class="cbCell <c:if test="${!authorized}">hidden</c:if>">
                                            </td>
                                            <td class="nameCell">
                                                Warenname
                                            </td>
                                            <td class="col2Cell">
                                                Ablaufdatum
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        <c:forEach var="delivery" items="${deliveryList}">
                            <div class="contentEntry">
                                <div class="entryContent">
                                    <table>
                                        <tr>
                                            <td class="cbCell <c:if test="${!authorized}">hidden</c:if>">
                                                <input type="checkbox" name="cb_${delivery}">
                                            </td>
                                            <td class="nameCell">
                                                <c:choose>
                                                    <c:when test="${expireToday.contains(delivery)}">
                                                        <font color="#ff0000">${delivery.getWarenname()}</font>
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${delivery.getWarenname()}
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td class="col2Cell">
                                                <c:choose>
                                                    <c:when test="${expireToday.contains(delivery)}">
                                                        <font color="#ff0000">${delivery.getAblaufdatum()}</font>
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${delivery.getAblaufdatum()}
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </c:forEach>
                        <div id="deleteLieferungenModal" class="modal">
                            <div class="modal-content">
                                <div class="modalHeader">
                                    <div class="headerContent">
                                        Neue Lieferung
                                    </div>
                                    <span class="close" onclick="closeModal('deleteLieferungenModal')">&#10005</span>
                                </div>
                                <div class="modalValue">
                                    <center>
                                        <h3>
                                            Möchten Sie die ausgewählten Lieferung wirklich löschen?<br>
                                            Diese Aktion kann nicht rückgängig gemacht werden
                                        </h3>
                                        <div class="modalButtons">
                                            <button class="confirmButton" onclick="submit()" name="deleteLieferung">OK</button>
                                            <button type="button" class="cancelButton" onclick="closeModal('deleteLieferungenModal')">Abbrechen</button>
                                        </div>
                                        <input type="hidden" name="lieferungenliste">

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
                            <input type="hidden" name="lieferungenliste">
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
                                    <input type="hidden" name="lieferungenliste">
                                </form>
                            </center>
                        </div>
                    </div>
                </div>

                <div id="itemModal" class="modal">
                    <div class="modal-content">
                        <div class="modalHeader">
                            <div class="headerContent">
                                Neue Lieferung
                            </div>
                            <span class="close" onclick="closeModal('itemModal')">&#10005</span>
                        </div>
                        <div class="modalValue">
                            <center>
                                <form method="POST" action="JetCheckController" name="newDelivery">
                                    <div class="inputForm">
                                        <Select class="inputField" name="deliveryproductname">
                                                <option>Warenname</option>
                                            <c:forEach var="product" items="${products}">
                                                <option>${product}</option>
                                            </c:forEach>
                                        </Select>
                                        <br>
                                        <a>Ablaufdatum:</a>
                                        <br>
                                        <input class="inputField" type="date" name="ExpiryDate" data-date-format="DD MM YYYY" placeholder="Ablaufdatum">
                                        <br>
                                        <!-- <label class="formError"><c:if test="${insertError}">Ware existiert bereits</c:if></label> -->
                                </div>
                                <div class="modalButtons">
                                    <button class="confirmButton" onclick="submit()">OK</button>
                                    <button type="button" class="cancelButton" onclick="closeModal('itemModal')">Abbrechen</button>
                                </div>
                                <input type="hidden" name="lieferungenliste">
                            </form>
                        </center>

                    </div>
                </div>                  
            </div>
            <script src="src/modal.js" type="text/javascript"></script>
    </body>
</html>