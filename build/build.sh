#!/bin/bash
# Sync

telegram -M "`printenv ROM_NAME`: Build started"
SYNC_START=$(date +"%s")

sudo ./ErfanGSIs/url2GSI.sh $ROM_URL $ROM_NAME
    mkdir final

    SYNC_END=$(date +"%s")
    SYNC_DIFF=$((SYNC_END - SYNC_START))
    telegram -M "`printenv ROM_NAME`: Build completed successfully in $((SYNC_DIFF / 60)) minute(s) and $((SYNC_DIFF % 60)) seconds"

    SYNC_START=$(date +"%s")
    telegram -M "`printenv ROM_NAME`: Zipping GSI files started"

    export date2=`date +%Y%m%d%H%M`
    export sourcever2=`cat ./ErfanGSIs/ver`
    sudo chmod -R 777 ErfanGSIs/output
               
    cd ErfanGSIs/output/
               
    curl -sL https://git.io/file-transfer | sh
               
    zip -r "$ROM-AB-$sourcever2-$date2-ErfanGSI.7z" *-AB-*.img
    zip -r "$ROM-Aonly-$sourcever2-$date2-ErfanGSI.7z" *-Aonly-*.img

    SYNC_END=$(date +"%s")
    SYNC_DIFF=$((SYNC_END - SYNC_START))
    telegram -M "`printenv ROM_NAME`: Zipping completed successfully in $((SYNC_DIFF / 60)) minute(s) and $((SYNC_DIFF % 60)) seconds"

    SYNC_START=$(date +"%s")
    telegram -M "`printenv ROM_NAME`: Upload started"

    ./transfer $MIR "$ROM-Aonly-$sourcever2-$date2-ErfanGSI.7z"
    ./transfer $MIR "$ROM-AB-$sourcever2-$date2-ErfanGSI.7z"

    SYNC_END=$(date +"%s")
    SYNC_DIFF=$((SYNC_END - SYNC_START))
    telegram -M "`printenv ROM_NAME`: Upload completed successfully in $((SYNC_DIFF / 60)) minute(s) and $((SYNC_DIFF % 60)) seconds"

    SYNC_END=$(date +"%s")
    SYNC_DIFF=$((SYNC_END - SYNC_START))
    telegram -M "`printenv ROM_NAME`: Upload completed successfully in $((SYNC_DIFF / 60)) minute(s) and $((SYNC_DIFF % 60)) seconds"

    SYNC_START=$(date +"%s")
    telegram -M "`printenv ROM_NAME` GSI For A/AB Devices \n\n`printenv CAT_FILE`"
