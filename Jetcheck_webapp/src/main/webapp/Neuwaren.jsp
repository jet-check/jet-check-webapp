<%-- 
    Document   : Neuwaren
    Created on : 09.12.2020, 16:51:34
    Author     : Matio Tawdrous
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="src/app.css" rel="stylesheet" type="text/css"/>
        <script src="src/insertWarenValidation.js" type="text/javascript"></script>
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
                <div class="contentHead">Waren im System eintragen</div>
                <input id="warenname" type="text" name="Warenname" value="" />
                <input id="wareninsertbutton" type="submit" value="Bestätigen" name="insertButton" />
            </div>  
        </div>
    </body>
</html>