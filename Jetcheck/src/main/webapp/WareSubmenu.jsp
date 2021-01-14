
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
            
                <div class="menuContainer">
                    <div class="itemRow">
                        <div class="rowItem">
                            <div class="itemContent">
                                <svg width="300" height="180">
                                <rect x="50" y="20" width="150" height="150"
                                      style="fill:#fdc400;stroke:#fdc400;stroke-width:5;fill-opacity:0.1;stroke-opacity:0.9" />
                                </svg>
                                <br>
                                <button class="menuButton" name="productBtn">Waren</button>
                            </div>
                        </div>
                        <div class="rowItem">
                            <div class="itemContent">
                                <svg width="300" height="180">
                                <rect x="50" y="20" width="150" height="150"
                                      style="fill:#fdc400;stroke:#fdc400;stroke-width:5;fill-opacity:0.1;stroke-opacity:0.9" />
                                </svg>
                                <br>
                                <button class="menuButton" name="productBtn">Lieferungen</button>
                            </div>
                        </div>
                        <div class="rowItem">
                            <div class="itemContent">
                                <svg width="300" height="180">
                                <rect x="50" y="20" width="150" height="150"
                                      style="fill:#fdc400;stroke:#fdc400;stroke-width:5;fill-opacity:0.1;stroke-opacity:0.9" />
                                </svg>
                                <br>
                                <button class="menuButton" name="productBtn">Bruchwaren</button>
                            </div>
                        </div>
                    </div>
                </div>
            
        </div>
    </body>
</html>

