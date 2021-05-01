
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
                    <svg xmlns="http://www.w3.org/2000/svg" width="137.078" height="210" viewBox="0 0 137.078 151.781">
                    <g id="Rechteck_126" data-name="Rechteck 126" transform="translate(0.596 19.563)" fill="none" stroke="#fdc400" stroke-linecap="round" stroke-linejoin="round" stroke-width="5">
                    <rect width="114" height="132" stroke="none"/>
                    <rect x="2.5" y="2.5" width="109" height="127" fill="none"/>
                    </g>
                    <path id="Pfad_43" data-name="Pfad 43" d="M-5203.765,2645.116l23.032-17.73-4.382-129.051-28.372,7.83,9.625,10.537Z" transform="translate(5315.311 -2495.834)" fill="none" stroke="#fdc400" stroke-linecap="round" stroke-linejoin="round" stroke-width="5"/>
                    <path id="Pfad_44" data-name="Pfad 44" d="M-5181.415,2626.312l-22.966-22.976" transform="translate(5315.994 -2496.124)" fill="none" stroke="#fdc400" stroke-width="5"/>
                    <path id="Pfad_45" data-name="Pfad 45" d="M-5178.893,2498.334h-111.246l9.525,8.893-24.547,10.372" transform="translate(5308.438 -2495.834)" fill="none" stroke="#fdc400" stroke-linecap="round" stroke-linejoin="round" stroke-width="5"/>
                    <path id="Pfad_46" data-name="Pfad 46" d="M-5291.024,2498.334v12.512" transform="translate(5309.498 -2495.834)" fill="none" stroke="#fdc400" stroke-linecap="round" stroke-width="5"/>
                    <path id="Pfad_47" data-name="Pfad 47" d="M-5291.024,2498.334v10.815" transform="translate(5392.271 -2487.234)" fill="none" stroke="#fdc400" stroke-linecap="round" stroke-width="5"/>
                    <path id="Pfad_48" data-name="Pfad 48" d="M-5291.024,2498.334v10.076" transform="translate(5319.172 -2486.646)" fill="none" stroke="#fdc400" stroke-linecap="round" stroke-width="5"/>
                    </svg>
                </center>
                </td>
                <td class="menuItem"> 
                <center>
                    <svg xmlns="http://www.w3.org/2000/svg" width="191.985" height="210" viewBox="0 0 191.985 184.259">
                    <g id="Rechteck_150" data-name="Rechteck 150" transform="translate(0 110.637) rotate(-11)" fill="none" stroke="#fcc300" stroke-linecap="round" stroke-linejoin="round" stroke-width="5">
                    <rect width="181" height="75" rx="33" stroke="none"/>
                    <rect x="2.5" y="2.5" width="176" height="70" rx="30.5" fill="none"/>
                    </g>
                    <path id="Pfad_66" data-name="Pfad 66" d="M-5337.9,2587.47a162.3,162.3,0,0,0-2.807,25.722c-.083,11.947-14.363-20.175-14.363-20.175" transform="translate(5673.224 -1814.093) rotate(7)" fill="none" stroke="#fdc400" stroke-linecap="round" stroke-linejoin="round" stroke-width="5"/>
                    <path id="Pfad_64" data-name="Pfad 64" d="M-5262.553,2562.108s-2.443,20.329,0,30.861-14.314-26.614-14.314-26.614" transform="translate(5674.095 -1812.979) rotate(7)" fill="none" stroke="#fdc400" stroke-linecap="round" stroke-linejoin="round" stroke-width="5"/>
                    <path id="Pfad_65" data-name="Pfad 65" d="M-5296.948,2572.556s-4.259,19.982,0,28.354-20.7-21.641-20.7-21.641" transform="translate(5672.98 -1812.107) rotate(7)" fill="none" stroke="#fdc400" stroke-linecap="round" stroke-linejoin="round" stroke-width="5"/>
                    <path id="Pfad_67" data-name="Pfad 67" d="M-5346.48,2568.548s-11.936-3.329,0-20.329-2.426-26.043-2.426-26.043" transform="translate(5670.247 -1814.458) rotate(7)" fill="none" stroke="#fcc300" stroke-linecap="round" stroke-linejoin="round" stroke-width="5"/>
                    <path id="Pfad_68" data-name="Pfad 68" d="M-5288.706,2551.763s-9.785-12.563,0-24.867-5.881-24.071-5.881-24.071" transform="translate(5661.192 -1814.563) rotate(7)" fill="none" stroke="#fcc300" stroke-linecap="round" stroke-linejoin="round" stroke-width="5"/>
                    <path id="Pfad_69" data-name="Pfad 69" d="M-5261.31,2545.844s-6.336-3.1-2.469-10.591,0-18.316,0-18.316" transform="translate(5670.247 -1814.458) rotate(7)" fill="none" stroke="#fcc300" stroke-linecap="round" stroke-linejoin="round" stroke-width="5"/>
                    <g id="Ellipse_16" data-name="Ellipse 16" transform="translate(65.342) rotate(7)" fill="none" stroke="#fcc300" stroke-linecap="round" stroke-linejoin="round" stroke-width="5">
                    <circle cx="4.5" cy="4.5" r="4.5" stroke="none"/>
                    <circle cx="4.5" cy="4.5" r="2" fill="none"/>
                    </g>
                    <g id="Ellipse_17" data-name="Ellipse 17" transform="translate(157.371 54.623) rotate(7)" fill="none" stroke="#fcc300" stroke-linecap="round" stroke-linejoin="round" stroke-width="5">
                    <circle cx="4.5" cy="4.5" r="4.5" stroke="none"/>
                    <circle cx="4.5" cy="4.5" r="2" fill="none"/>
                    </g>
                    </svg>

                </center>
                </td>
                <td class="menuItem">
                <center>
                    <svg xmlns="http://www.w3.org/2000/svg" width="236.306" height="210" viewBox="0 0 236.306 111.913">
                    <g id="Pfad_76" data-name="Pfad 76" transform="translate(62.318 -14.842) rotate(16)" fill="none" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M61.98.884,148,0a33,33,0,0,1,33,33v9a33,33,0,0,1-33,33l-86.02.884L56.5,69.7,61.1,46.069,53.846,29.791Z" stroke="none"/>
                    <path d="M 148.0240173339844 5.000007629394531 L 65.77824401855469 5.845527648925781 L 59.14810180664062 29.40642166137695 L 65.66433715820312 44.03466796875 C 66.08200073242188 44.97227096557617 66.20098876953125 46.01568603515625 66.005126953125 47.02325057983398 L 61.88279724121094 68.23062133789062 L 64.21121215820312 70.86109924316406 L 147.9486083984375 70.00027465820312 C 147.9657287597656 70.00008392333984 147.9828796386719 70 148 70 C 151.7821960449219 70 155.4485778808594 69.2603759765625 158.8973388671875 67.80166625976562 C 162.23095703125 66.39167022705078 165.2258911132812 64.37208557128906 167.7989807128906 61.79898071289062 C 170.3720855712891 59.22589874267578 172.3916625976562 56.23095703125 173.8016662597656 52.89733123779297 C 175.2603759765625 49.44856262207031 176 45.78218841552734 176 42 L 176 33 C 176 29.21781158447266 175.2603759765625 25.55143737792969 173.8016662597656 22.10266876220703 C 172.3916625976562 18.76904296875 170.3720855712891 15.77410507202148 167.7989807128906 13.20102310180664 C 165.2258911132812 10.62791442871094 162.23095703125 8.60833740234375 158.8973388671875 7.198333740234375 C 155.4559326171875 5.742744445800781 151.7976379394531 5.003166198730469 148.0240173339844 5.000007629394531 M 148 0 C 166.2254028320312 0 181 14.77460479736328 181 33 L 181 42 C 181 60.22539520263672 166.2254028320312 75 148 75 L 61.98014831542969 75.88429260253906 L 56.50404357910156 69.69775390625 L 61.09700012207031 46.06920623779297 L 53.84571838378906 29.79085540771484 L 61.98014831542969 0.8843154907226562 L 148 0 Z" stroke="none" fill="#fcc300"/>
                    </g>
                    <g id="Pfad_77" data-name="Pfad 77" transform="translate(134.253 39.805) rotate(139)" fill="none" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M61.98.884,77.93,2.026a33,33,0,0,1,33,33v9a33,33,0,0,1-33,33L61.98,75.884,56.5,69.7,61.1,46.069,53.846,29.791Z" stroke="none"/>
                    <path d="M 65.68901062011719 6.162620544433594 L 59.14810180664062 29.40639114379883 L 65.66432952880859 44.03467178344727 C 66.08199310302734 44.97227096557617 66.20097351074219 46.01570129394531 66.00513458251953 47.02325820922852 L 61.88283538818359 68.23062896728516 L 64.37200927734375 71.04273986816406 L 78.10123443603516 72.02569580078125 C 81.82267761230469 72.00364685058594 85.43038940429688 71.26448822021484 88.82693481445312 69.82787322998047 C 92.16053009033203 68.41786956787109 95.15546417236328 66.39826965332031 97.72853088378906 63.82518768310547 C 100.3015899658203 61.25209808349609 102.321174621582 58.25715637207031 103.7311553955078 54.92353057861328 C 105.1898651123047 51.47476959228516 105.9294738769531 47.80837249755859 105.9294738769531 44.02618408203125 L 105.9294738769531 35.02618408203125 C 105.9294738769531 31.24399948120117 105.1898651123047 27.57759857177734 103.7311553955078 24.12884140014648 C 102.321174621582 20.79521560668945 100.3015899658203 17.80025863647461 97.72853088378906 15.2271728515625 C 95.15546417236328 12.65408325195312 92.16053009033203 10.63449859619141 88.82693481445312 9.224502563476562 C 85.37818908691406 7.765800476074219 81.71181488037109 7.026168823242188 77.92964935302734 7.026168823242188 C 77.81051635742188 7.026168823242188 77.69142150878906 7.02191162109375 77.57258605957031 7.013397216796875 L 65.68901062011719 6.162620544433594 M 61.98016357421875 0.8843002319335938 L 77.92964935302734 2.026168823242188 C 96.15502166748047 2.026168823242188 110.9294738769531 16.80078506469727 110.9294738769531 35.02618408203125 L 110.9294738769531 44.02618408203125 C 110.9294738769531 62.25157165527344 96.15502166748047 77.02619934082031 77.92964935302734 77.02619934082031 L 61.98016357421875 75.88428497314453 L 56.50405883789062 69.69775390625 L 61.09699249267578 46.0692138671875 L 53.84571838378906 29.79084396362305 L 61.98016357421875 0.8843002319335938 Z" stroke="none" fill="#fcc300"/>
                    </g>
                    <path id="Pfad_79" data-name="Pfad 79" d="M-3825.512-7769.318l4.151,1.6v-5.144Z" transform="translate(-5321.354 6840.631) rotate(65)" fill="none" stroke="#fcc300" stroke-linecap="round" stroke-linejoin="round" stroke-width="5"/>
                    <path id="Pfad_73" data-name="Pfad 73" d="M-5262.553,2562.108s-2.443,20.329,0,30.861-14.314-26.614-14.314-26.614" transform="translate(5991.276 847.189) rotate(34)" fill="none" stroke="#fdc400" stroke-linecap="round" stroke-linejoin="round" stroke-width="5"/>
                    <path id="Pfad_74" data-name="Pfad 74" d="M-5296.948,2572.556s-4.259,19.982,0,28.354-20.7-21.641-20.7-21.641" transform="translate(5989.888 847.459) rotate(34)" fill="none" stroke="#fdc400" stroke-linecap="round" stroke-linejoin="round" stroke-width="5"/>
                    <path id="Pfad_78" data-name="Pfad 78" d="M-3825.512-7769.318l4.151,1.6v-5.144Z" transform="translate(3888.499 7805.842)" fill="none" stroke="#fcc300" stroke-linecap="round" stroke-linejoin="round" stroke-width="5"/>
                    </svg>

                </center>

                </td>
                </tr>
                <tr class="menuRow">
                    <td class="menuItem">
                <center>
                    <form method="POST" action="?">
                        <input type="submit" class="menuButton" value="Entnahmen Mitarbeiter" name="GebaeckEntnahmen">
                    </form>

                </center>
                </td>
                <td class="menuItem">
                <center>
                    <form method="POST" action="?">
                        <input type="submit" class="menuButton" value="Altgebäck" name="altGebBtn">
                    </form>
                </center>

                </td>
                <td class="menuItem">
                <center>
                    <form method="POST" action="?">
                        <input type="submit" class="menuButton" value="Bruchgebäck" name="bruchGebBtn">
                    </form>
                </center>
                </td>
                </tr>
            </table>
        </div>
    </body>
</html>

