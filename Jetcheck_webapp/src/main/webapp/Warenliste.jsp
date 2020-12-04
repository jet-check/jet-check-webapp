
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
                    <div class="contentButton">
                        <p class="contentButtonText">Hinzufügen</p>
                    </div>
                    <div class="contentButton">
                        <p class="contentButtonText">Löschen</p>
                    </div>
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
                <div class="buttonBackCancel button" name="backcancel">
                    <p class="buttonText">
                        <c:choose>
                        <c:when test="${authorized}">
                            Abbrechen
                        </c:when>
                        <c:otherwise>
                            Zurück
                        </c:otherwise>
                    </c:choose>
                    </p>
                </div>
                <div class="buttonEditAck button" name="editack">
                    <p class="buttonText">
                        <c:choose>
                        <c:when test="${authorized}">
                            Fertig
                        </c:when>
                        <c:otherwise>
                            Bearbeiten
                        </c:otherwise>
                    </c:choose>
                    </p>
                </div>
            </div>
        </div>
    </body>
</html>
