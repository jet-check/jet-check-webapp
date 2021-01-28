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
                <div class="contentHead">Waren</div>
                <div class="contentButtonPane <c:if test="${!authorized}">hidden</c:if>">
                        <button class="contentButton" onclick="openModal('itemModal')">
                            Hinzufügen
                        </button>
                        <button class="contentButton" onclick="openModal('deleteWarenModal')">
                            Löschen
                        </button>
                    </div>
                    <div class="contentEntryPane">
                    <form method="POST" action="JetCheckController">
                        <c:forEach var="product" items="${products}">
                        <div class="contentEntry">
                            <div class="entryContent">
                                <table>
                                    <tr>
                                        <td class="cbCell <c:if test="${!authorized}">hidden</c:if>">
                                            <input type="checkbox" name="cb_${product}">
                                        </td>
                                        <td class="valueCell">
                                            ${product}
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </c:forEach>
                        
                        <div id="deleteWarenModal" class="modal">
                    <div class="modal-content">
                        <div class="modalHeader">
                            <div class="headerContent">
                                Neue Ware
                            </div>
                            <span class="close" onclick="closeModal('deleteWarenModal')">&#10005</span>
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
                                <input type="hidden" name="warenliste">
                           
                        </center>

                    </div>
                </div>                  
            </div>
                         
                    </form>
                    
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
                                    <input type="hidden" name="warenliste">
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
                            <span class="close" onclick="closeModal('itemModal')">&#10005</span>
                    </div>
                    <div class="modalValue">
                        <center>
                                <form method="POST" action="JetCheckController" name="newProduct">
                                <div class="inputForm">

                                    <input class="inputField" type="text" name="productname" placeholder="Warenname">
                                    <br>
                                    <label class="formError"><c:if test="${insertError}">Ware existiert bereits</c:if></label>
                                </div>
                                <div class="modalButtons">
                                    <button class="confirmButton" onclick="submit()">OK</button>
                                    <button type="button" class="cancelButton" onclick="closeModal('itemModal')">Abbrechen</button>
                                </div>
                                <input type="hidden" name="warenliste">
                            </form>
                        </center>

                    </div>
                </div>                  
            </div>
            <script src="src/modal.js" type="text/javascript"></script>
    </body>
</html>
