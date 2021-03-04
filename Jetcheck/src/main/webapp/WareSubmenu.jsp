
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
                    <svg xmlns="http://www.w3.org/2000/svg" width="201.993" height="210" viewBox="0 0 201.993 93.721">
                    <g id="Gruppe_33" data-name="Gruppe 33" transform="translate(-664.315 -350.497)">
                    <g id="Gruppe_32" data-name="Gruppe 32">
                    <path id="Vereinigungsmenge_2" data-name="Vereinigungsmenge 2" d="M26.853,88.721v-.006H0l8.2-8.49L0,72.55l8.2-8.9L0,56.511,8.2,47.43,0,39.112l8.2-9.675L0,20.685l8.2-9.592L0,0H196.993l-8.2,8.49,8.2,7.675-8.2,8.9,8.2,7.135-8.2,9.082,8.2,8.318-8.2,9.674,8.2,8.752-8.2,9.591,8.2,11.093H171.348v.006Z" transform="matrix(1, 0, 0, 1, 666.815, 352.997)" fill="#fff" stroke="#fdc400" stroke-linecap="round" stroke-linejoin="round" stroke-width="5"/>
                    <g id="Rechteck_110" data-name="Rechteck 110" transform="matrix(1, 0, 0, 1, 700.994, 351.004)" fill="none" stroke="#fdc400" stroke-linecap="round" stroke-linejoin="round" stroke-width="5">
                    <rect width="130" height="93" stroke="none"/>
                    <rect x="2.5" y="2.5" width="125" height="88" fill="none"/>
                    </g>
                    </g>
                    </g>
                    </svg>
                </center>
                </td>
                <td class="menuItem"> 
                <center>
                    <svg xmlns="http://www.w3.org/2000/svg" width="187" height="210" viewBox="0 0 187 110">
                    <g id="Gruppe_34" data-name="Gruppe 34" transform="translate(-1087 -342)">
                    <g id="Rechteck_113" data-name="Rechteck 113" transform="translate(1087 342)" fill="#fff" stroke="#fdc400" stroke-linecap="round" stroke-linejoin="round" stroke-width="5">
                    <rect width="126" height="93" stroke="none"/>
                    <rect x="2.5" y="2.5" width="121" height="88" fill="none"/>
                    </g>
                    <g id="Differenzmenge_3" data-name="Differenzmenge 3" transform="translate(1208.432 350.861)" fill="none" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M65.568,83.451H0V0H22.37l43.2,40.65v42.8Z" stroke="none"/>
                    <path d="M 60.56787490844727 78.44970703125 L 60.56787490844727 42.8105354309082 L 20.38700485229492 5.000002384185791 L 4.999997138977051 5.000002384185791 L 4.999997138977051 78.44970703125 L 60.56787490844727 78.44970703125 M 65.56787109375 83.450927734375 L 65.56787109375 83.44970703125 L -2.914663355113589e-06 83.44970703125 L -2.914663355113589e-06 2.328725940969889e-06 L 22.36962699890137 2.328725940969889e-06 L 65.56787109375 40.64990997314453 L 65.56787109375 83.44970703125 L 65.56787109375 83.450927734375 Z" stroke="none" fill="#fdc400"/>
                    </g>
                    <g id="Ellipse_1" data-name="Ellipse 1" transform="translate(1107 419)" fill="#fff" stroke="#fdc400" stroke-linecap="round" stroke-linejoin="round" stroke-width="5">
                    <ellipse cx="17" cy="16.5" rx="17" ry="16.5" stroke="none"/>
                    <ellipse cx="17" cy="16.5" rx="14.5" ry="14" fill="none"/>
                    </g>
                    <g id="Ellipse_2" data-name="Ellipse 2" transform="translate(1219 419)" fill="#fff" stroke="#fdc400" stroke-linecap="round" stroke-linejoin="round" stroke-width="5">
                    <ellipse cx="17" cy="16.5" rx="17" ry="16.5" stroke="none"/>
                    <ellipse cx="17" cy="16.5" rx="14.5" ry="14" fill="none"/>
                    </g>
                    </g>
                    </svg> 
                </center>
                </td>
                <td class="menuItem">
                <center>
                    <svg xmlns="http://www.w3.org/2000/svg" width="255.438" height="210.804" viewBox="0 0 255.438 210.804">
                    <g id="Gruppe_26" data-name="Gruppe 26" transform="translate(-1374.104 -552.739) rotate(10)">
                    <path id="Differenzmenge_2" data-name="Differenzmenge 2" d="M-1785.586-2375.752v0l5.17-10.605-10.167-4.767,5.044-11-10-4.253,4.988-11.17-10.364-5.378,4.805-11.734-10.5-5.791,4.83-11.655-11.222-8.017,25.539-8.3,44.929-14.6,31.04,5.625-15.93,22.58,22.9,4.768-6.971,17.3,23.245-19.143-14.471-12.647,18.077-17.914-16.52-14.01,51.122-16.611,24.39-7.924-5.171,10.607,10.167,4.766-5.044,11,10,4.252-4.989,11.171,10.366,5.378-4.806,11.732,10.5,5.792-4.832,11.655,11.223,8.017-24.39,7.925,0,.005-137.422,44.652,0-.007-25.537,8.3Z" transform="translate(2941.562 3049.278) rotate(8)" fill="#fff" stroke="#fdc400" stroke-linecap="round" stroke-linejoin="round" stroke-width="5"/>
                    <path id="Differenzmenge_1" data-name="Differenzmenge 1" d="M-1782.656-2395.53l-27.193-83.693,36.482-11.854,29.986,5.434-15.929,22.579,22.9,4.769-6.971,17.3,23.245-19.142-14.47-12.648,18.077-17.913-16.066-13.625,41.627-13.525,27.193,83.693-118.882,38.627Z" transform="translate(2971.993 3061.881) rotate(8)" fill="#fff" stroke="#fdc400" stroke-linecap="round" stroke-linejoin="round" stroke-width="5"/>
                    <line id="Linie_22" data-name="Linie 22" y1="11" x2="31" transform="translate(1577.676 341.884) rotate(8)" fill="none" stroke="#fdc400" stroke-linecap="round" stroke-width="5"/>
                    </g>
                    </svg>
                </center>

                </td>
                </tr>
                <tr class="menuRow">
                    <td class="menuItem">
                <center>
                    <form method="POST" action="JetCheckController">
                        <input type="submit" class="menuButton" value="Waren" name="warenliste">  
                    </form>
                </center>
                </td>
                <td class="menuItem">
                <center>
                    <form method="POST" action="JetCheckController">
                        <input type="submit" class="menuButton" value="Lieferungen" name="lieferungenliste">
                    </form>
                </center>

                </td>
                <td class="menuItem">
                <center>
                    <form method="POST" action="JetCheckController">
                        <input type="submit" class="menuButton" value="Bruchwaren" name="bruchwarenliste">
                    </form>
                </center>
                </td>
                </tr>
            </table>
        </div>
    </body>
</html>

