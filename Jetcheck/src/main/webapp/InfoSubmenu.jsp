
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
            <table class="menuContainer">
                <tr class="menuRow">
                    <td class="menuItem">
                <center>
                    <svg xmlns="http://www.w3.org/2000/svg" width="132" height="210" viewBox="0 0 132 135">
                    <g id="Rechteck_148" data-name="Rechteck 148" fill="none" stroke="#fdc400" stroke-linecap="round" stroke-linejoin="round" stroke-width="5">
                    <rect width="132" height="135" stroke="none"/>
                    <rect x="2.5" y="2.5" width="127" height="130" fill="none"/>
                    </g> 
                    <g id="Rechteck_149" data-name="Rechteck 149" fill="none" stroke="#fdc400" stroke-linecap="round" stroke-linejoin="round" stroke-width="5">
                    <rect width="132" height="33" stroke="none"/>
                    <rect x="2.5" y="2.5" width="127" height="28" fill="none"/>
                    </g> 
                    <line id="Linie_41" data-name="Linie 41" x2="79" transform="translate(33.5 54.5)" fill="none" stroke="#fdc400" stroke-linecap="round" stroke-width="5"/>
                    <line id="Linie_42" data-name="Linie 42" transform="translate(19.5 54.5)" fill="none" stroke="#fdc400" stroke-linecap="round" stroke-width="5"/>
                    <line id="Linie_43" data-name="Linie 43" x2="79" transform="translate(33.5 71.5)" fill="none" stroke="#fdc400" stroke-linecap="round" stroke-width="5"/>
                    <line id="Linie_44" data-name="Linie 44" transform="translate(19.5 71.5)" fill="none" stroke="#fdc400" stroke-linecap="round" stroke-width="5"/>
                    <line id="Linie_45" data-name="Linie 45" x2="79" transform="translate(33.5 88.5)" fill="none" stroke="#fdc400" stroke-linecap="round" stroke-width="5"/>
                    <line id="Linie_46" data-name="Linie 46" transform="translate(19.5 88.5)" fill="none" stroke="#fdc400" stroke-linecap="round" stroke-width="5"/>
                    <line id="Linie_47" data-name="Linie 47" x2="79" transform="translate(33.5 105.5)" fill="none" stroke="#fdc400" stroke-linecap="round" stroke-width="5"/>
                    <line id="Linie_48" data-name="Linie 48" transform="translate(19.5 105.5)" fill="none" stroke="#fdc400" stroke-linecap="round" stroke-width="5"/>
                    </svg>

                </center>
                </td>
                <td class="menuItem"> 
                <center>
                    <svg xmlns="http://www.w3.org/2000/svg" width="160.844" height="210" viewBox="0 0 160.844 147.453">
                    <g id="Rechteck_151" data-name="Rechteck 151" transform="translate(0 41.453)" fill="none" stroke="#fdc400" stroke-linecap="round" stroke-linejoin="round" stroke-width="5">
                    <rect width="130" height="106" stroke="none"/>
                    <rect x="2.5" y="2.5" width="125" height="101" fill="none"/>
                    </g>
                    <path id="Pfad_70" data-name="Pfad 70" d="M-2170.768-7825.207c-85.152,53.134-100.744,121.928-100.744,121.928l-33.132-40.884,9.7-7.8,19.2,23.962" transform="translate(2328.14 7835.648)" fill="none" stroke="#fdc400" stroke-linecap="round" stroke-linejoin="round" stroke-width="5"/>
                    <path id="Pfad_71" data-name="Pfad 71" d="M97.956,0C78.007,7.55,18.588,60.112,0,104.435" transform="matrix(0.998, 0.07, -0.07, 0.998, 59.686, 3.442)" fill="none" stroke="#fdc400" stroke-linecap="round" stroke-width="5"/>
                    </svg>
                </center>
                </td>
                <td class="menuItem">
                <center>
                    <svg xmlns="http://www.w3.org/2000/svg" width="158.213" height="210" viewBox="0 0 158.213 149.15">
                    <path id="Differenzmenge_5" data-name="Differenzmenge 5" d="M6172.5,9199.528h-127v-113h111.642l1.947,2.429-4.728,16.3,15.949-6.45,2.191,1.389v99.329Z" transform="translate(-6043 -9052.878)" fill="none" stroke="#fdc400" stroke-linecap="round" stroke-linejoin="round" stroke-width="5"/>
                    <line id="Linie_49" data-name="Linie 49" x2="79" transform="translate(31.5 74.649)" fill="none" stroke="#fdc400" stroke-linecap="round" stroke-width="5"/>
                    <line id="Linie_50" data-name="Linie 50" transform="translate(17.5 74.649)" fill="none" stroke="#fdc400" stroke-linecap="round" stroke-width="5"/>
                    <line id="Linie_51" data-name="Linie 51" x2="79" transform="translate(31.5 91.649)" fill="none" stroke="#fdc400" stroke-linecap="round" stroke-width="5"/>
                    <line id="Linie_53" data-name="Linie 53" x2="79" transform="translate(31.5 108.649)" fill="none" stroke="#fdc400" stroke-linecap="round" stroke-width="5"/>
                    <path id="Pfad_72" data-name="Pfad 72" d="M-1766.148-7895.039l15.758-2.408-8.512,14.694,6.934,15.574-16.356-4.5-13.366,10.831-.247-16.975-13.881-9.462,14.927-4.349,3.843-16.405Z" transform="translate(-483.087 8090.66) rotate(17)" fill="none" stroke="#fdc400" stroke-linecap="round" stroke-linejoin="round" stroke-width="5"/>
                    </svg>
                </center>

                </td>
                </tr>
                <tr class="menuRow">
                    <td class="menuItem">
                <center>
                    <form method="POST" action="JetCheckController">
                        <input type="submit" class="menuButton" value="Dienstplan" name="dienstplan">
                    </form>

                </center>
                </td>
                <td class="menuItem">
                <center>
                    <form method="POST" action="JetCheckController">
                        <input type="submit" class="menuButton" value="Schichtaufträge" name="schichtBtn">
                    </form>
                </center>

                </td>
                <td class="menuItem">
                <center>
                    <form method="POST" action="JetCheckController">
                        <input type="submit" class="menuButton" value="Sonderaufgaben" name="sonderaufgaben">
                    </form>
                </center>
                </td>
                </tr>
            </table>
        </div>
    </body>
</html>

