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
                <div class="navEntry selected">
                    <a href="WareSubmenu.jsp" class="navLink">Waren</a>
                </div>
            </div>
            <div class="navItemContainer">
                <div class="navEntry">
                    <a href="GebäckSubmenu.jsp" class="navLink">Gebäck</a>
                </div>    
            </div>    
            <div class="navItemContainer">
                <div class="navEntry">
                    <a href="InfoSubmenu.jsp" class="navLink">Information</a>
                </div>    
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
                    <c:set var="count" value="${1}"></c:set>
                    <c:forEach var="product" items="${brokenProducts}">
                        <div class="contentEntry">
                            <div class="entryContent">
                                <table style="width: 100%">
                                    <tr>
                                        <td class="cbCell <c:if test="${!authorized}">hidden</c:if>">
                                            <input type="checkbox" name="cb_${count}">
                                            <c:set var="count" value="${count + 1}"></c:set> 
                                            </td>
                                            <td class="valueCell">
                                            ${product.getWarenname()}
                                        </td>
                                        <td class="amountCell">
                                            ${product.getAnzahl()}
                                        </td>
                                        <td class="dateCell">
                                            ${product.getDateFormatted()}
                                        </td>
                                    </tr>
                                </table>
                            </div>
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
                            <input type="hidden" name="bruchwarenliste">
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
                                        <Select class="inputField" name="brokenproductname">
                                            <option>Warenname</option>
                                            <c:forEach var="product" items="${products}">
                                                <option>${product}</option>
                                            </c:forEach>
                                        </Select>
                                        <br><br>
                                        <input class="inputField" type="date" name="date" placeholder="Datum">
                                        <br><br>
                                        <input class="inputField" type="number" name="quantity" placeholder="Menge">
                                        <br>
                                        <label class="formError"><c:if test="${insertError}">Ware existiert bereits</c:if></label>
                                    </div>

                                    <div class="modalButtons">
                                        <button class="confirmButton" onclick="submit()">OK</button>
                                        <button type="button" class="cancelButton" onclick="closeItemModal()">Abbrechen</button>
                                    </div>
                                    <input type="hidden" name="bruchwarenliste">
                                </form>
                            </center>
                        </div>
                    </div>                  
                </div>
            <script src="src/modal.js" type="text/javascript"></script>
    </body>
</html>
