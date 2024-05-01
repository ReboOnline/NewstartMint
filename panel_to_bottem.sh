#!/bin/bash

# Maak een kopie van cinnamon.css om in te bewerken
cp /usr/share/cinnamon/theme/cinnamon.css ~/.config/cinnamon/cinnamon.css

# Maak een nieuw css-bestand met de gewenste aanpassingen
echo '
#panel {
    background-color: rgba(0,0,0,0) !important;
    border: 1px solid #000; /* Zwarte rand */
    border-radius: 0; /* Maak de randen recht */
    box-shadow: none; /* Verwijder schaduw */
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
' >> ~/.config/cinnamon/cinnamon.css

# Herstart Cinnamon om de wijzigingen toe te passen
cinnamon --replace &
