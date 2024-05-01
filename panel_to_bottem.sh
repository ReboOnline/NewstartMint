#!/bin/bash

# Maak een back-up van het originele bestand
sudo cp /usr/share/cinnamon/theme/cinnamon.css /usr/share/cinnamon/theme/cinnamon.css.bak

# Maak een nieuw css-bestand met de gewenste aanpassingen
echo '
#panel {
    background-color: rgba(0,0,0,0) !important;
    border: 1px solid #000; /* Zwarte rand */
    border-radius: 10px; /* Maakt de hoeken afgerond met een straal van 10 pixels */
    box-shadow: 0 1px 5px rgba(104, 104, 104, 0.8; /* Verwijder schaduw */
    font-size: 11pt; /* Pas de lettergrootte aan */
    padding: 2px; /* Pas de opvulling aan */
    position: fixed; /* Plaats de taakbalk vast */
    bottom: 2mm; /* Plaats de taakbalk 2 millimeter vanaf de onderkant van het scherm */
    left: 10mm; /* Plaats de taakbalk 10 millimeter vanaf de linkerkant van het scherm */
    right: 10mm; /* Plaats de taakbalk 10 millimeter vanaf de rechterkant van het scherm */
    width: calc(100% - 20mm); /* Maak de taakbalk de breedte van het scherm min 20 millimeter (voor beide zijden) */
}

#panel .button-box {
    color: #888888 !important;
}

#panel .button-box:hover {
    background-color: #4caf50 !important;
}
' | sudo tee -a /usr/share/cinnamon/theme/cinnamon.css > /dev/null

# Herstart Cinnamon om de wijzigingen toe te passen
cinnamon --replace &
