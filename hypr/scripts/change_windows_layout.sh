#!/bin/bash

ORIGINAL_GAPS_OUT="20 20 20 20" # '20 20 40 20'
FOCUS_GAPS_OUT="0 0 0 0"        # '0 0 40 0'

FOCUS_GAPS_OUT_SET="0, 0, 0, 0"
ORIGINAL_GAPS_OUT_SET="20, 20, 20, 20"

ORIGINAL_GAPS_IN="10 10 10 10"
FOCUS_GAPS_IN="0 0 0 0"

ORIGINAL_ROUNDING="10"
FOCUS_ROUNDING="0"

ORIGINAL_BORDER="0"
FOCUS_BORDER="0"

# Get the current value of gaps_out
current_gapsOut=$(hyprctl getoption general:gaps_out | awk -F 'custom type: ' '{print $2}' | xargs)
current_gapsIn=$(hyprctl getoption general:gaps_in | awk -F 'custom type: ' '{print $2}' | xargs)
current_border=$(hyprctl getoption general:border_size | awk -F 'int: ' '{print $2}' | xargs)
current_rounding=$(hyprctl getoption decoration:rounding | awk -F 'int: ' '{print $2}' | xargs)

Update_Focus_Windows() {
    hyprctl keyword general:gaps_out $FOCUS_GAPS_OUT_SET
    hyprctl keyword general:gaps_in $FOCUS_GAPS_IN
    hyprctl keyword general:border_size $FOCUS_BORDER
    hyprctl keyword decoration:rounding $FOCUS_ROUNDING
}

Update_Original_Windows() {
    hyprctl keyword general:gaps_out $ORIGINAL_GAPS_OUT_SET
    hyprctl keyword general:gaps_in $ORIGINAL_GAPS_IN
    hyprctl keyword general:border_size $ORIGINAL_BORDER
    hyprctl keyword decoration:rounding $ORIGINAL_ROUNDING
}

# Check the current value and toggle it
if [ "$current_gapsOut" == "$ORIGINAL_GAPS_OUT" ]; then
    Update_Focus_Windows
elif [ "$current_gapsOut" == "$FOCUS_GAPS_OUT" ]; then
    Update_Original_Windows
fi

if [ $1 == "original" ]; then
    Update_Original_Windows
elif [ $1 == "win" ]; then
    hyprctl keyword general:gaps_out 20, 20, 20, 20
fi
