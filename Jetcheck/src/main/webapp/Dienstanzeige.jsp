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
                <div class="contentHead">${schicht}</div>
                <div class="contentEntryPane">
                    <form method="POST" action="JetCheckController">
                        <c:forEach var="todo" items="${todoList}">
                            <div class="contentEntry">
                                <div class="entryContent">
                                    <table>
                                        <tr>
                                            <td class="cbCell <c:if test="${!authorized}">hidden</c:if>">
                                                <input type="checkbox" name="cb_${todo}">
                                            </td>
                                            <td class="nameCell">
                                                ${todo}
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </c:forEach>
                    </form>
                </div>  
            </div>
        </div>    
    </body>
</html>
