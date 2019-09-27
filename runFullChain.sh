plotbase="/home/mhl/public_html/2017/20171207_cscSeg/2017C_expandStripPattern_addMoreWirePattern_useAddBack/"
date > log.txt
echo "plotbase: "$plotbase >> log.txt
# make segment using UF algo
#cmsRun reco_RAW2DIGI_RECO.py > reco_segment.txt
cmsRun reco_RAW2DIGI_RECO.py 2>&1 | cat > output.txt 

date >> log.txt
echo "UF segments made"

# process with UFCSCRootMaker
# 1 process UF algo
cp /raid/raid8/mhl/CSC_Run2/CMSSW_dev/CMSSW_9_2_13/src/UFCSCSoftware/UFCSCRootMaker/test/cscRootMaker_cfi_UF.py /raid/raid8/mhl/CSC_Run2/CMSSW_dev/CMSSW_9_2_13/src/UFCSCSoftware/UFCSCRootMaker/python/cscRootMaker_cfi.py
scram b -j 32
cmsRun UFCSCRootMaker.py
cp /raid/raid8/mhl/CSC_Run2/CMSSW_dev/analysisCode/inputRootFiles/DUMMYFILENAME.root /raid/raid8/mhl/CSC_Run2/CMSSW_dev/analysisCode/inputRootFiles/DUMMYFILENAME_UF.root

date >> log.txt
echo "run UFCSCRootMaker on UF seg" >> log.txt
ls -lrht /raid/raid8/mhl/CSC_Run2/CMSSW_dev/analysisCode/inputRootFiles/

# 2 process RU algo
cp /raid/raid8/mhl/CSC_Run2/CMSSW_dev/CMSSW_9_2_13/src/UFCSCSoftware/UFCSCRootMaker/test/cscRootMaker_cfi_RU.py /raid/raid8/mhl/CSC_Run2/CMSSW_dev/CMSSW_9_2_13/src/UFCSCSoftware/UFCSCRootMaker/python/cscRootMaker_cfi.py
scram b -j 32
cmsRun UFCSCRootMaker.py
cp /raid/raid8/mhl/CSC_Run2/CMSSW_dev/analysisCode/inputRootFiles/DUMMYFILENAME.root /raid/raid8/mhl/CSC_Run2/CMSSW_dev/analysisCode/inputRootFiles/DUMMYFILENAME_RU.root

date >> log.txt
echo "run UFCSCRootMaker on RU seg" >> log.txt
ls -lrht /raid/raid8/mhl/CSC_Run2/CMSSW_dev/analysisCode/inputRootFiles/

# run anlysis code
cd /raid/raid8/mhl/CSC_Run2/CMSSW_dev/analysisCode
./doAnalysis.sh ${plotbase}
date >> log.txt
echo "analysis plots done" >> log.txt
cd -

# run event displays
for chamber in "ME11" "nonME11"
do 
    for cat in "seg_uf_0_ru_1" "seg_uf_1_ru_0" "seg_uf_1_ru_2" "seg_uf_2_ru_1" "seg_uf_4_ru_4" "rh_uf_5_ru_6" "rh_uf_6_ru_5"
    do
    cp /raid/raid8/mhl/CSC_Run2/CMSSW_dev/analysisCode/logs/${cat}"_"${chamber}".txt" /raid/raid8/mhl/CSC_Run2/CMSSW_dev/CMSSW_9_2_13/src/eventList.txt
    echo $displaydir
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
