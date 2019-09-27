# run anlysis code
cd /raid/raid8/mhl/CSC_Run2/CMSSW_dev/analysisCode
./doAnalysis.sh $1
date >> log.txt
echo "analysis plots done" >> log.txt
cd -

# run event displays
for chamber in "ME11" "nonME11"
do
    for cat in "seg_uf_0_ru_1" "seg_uf_1_ru_0" "seg_uf_1_ru_2" "seg_uf_2_ru_1" "seg_uf_4_ru_4" "rh_uf_5_ru_6" "rh_uf_6_ru_5"
    do
    cp /raid/raid8/mhl/CSC_Run2/CMSSW_dev/analysisCode/logs/${cat}"_"${chamber}".txt" /raid/raid8/mhl/CSC_Run2/CMSSW_dev/CMSSW_9_2_13/src/eventList.txt
    displaydir=${plotbase}"eventdisplay/"${cat}"_"${chamber}
    mkdir -p $displaydir
    cp /home/mhl/public_html/index.php $displaydir
    cmsRun gifDisplay.py plotdir=$displaydir
    date >> log.txt
    echo ${cat}"_"${chamber}" plots done" >> log.txt
    done
done

date >> log.txt
echo "all done !" >> log.txt

