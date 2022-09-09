#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Immo
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🏠
# @raycast.argument1 { "type": "text", "placeholder": "sqm", "optional": false }
# @raycast.argument2 { "type": "text", "placeholder": "rent/sqm", "optional": false }
# @raycast.argument3 { "type": "text", "placeholder": "price k€", "optional": false }
# @raycast.packageName Raycast

# Documentation:
# @raycast.description Quickly calculate the return of a rental property
# @raycast.author Nicolai


sqm=${1// /%20}
rent_sqm=${2// /%20}
price=${3// /%20}


echo "(($sqm * $rent_sqm * 12) / $price * 1000) * 100" | bc -l 
