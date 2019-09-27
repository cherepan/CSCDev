#cmsDriver.py reco -s RAW2DIGI,RECO --conditions=80X_dataRun2_Prompt_v14  --data --filein file:SingleMu_raw_2016H.root --era Run2_2016 --fileout test2.root --eventcontent=RECO --inputCommands "keep *","drop *_*_*_RECO" --processName=reRECO -n 10
#cmsDriver.py reco -s RAW2RECO --conditions=80X_dataRun2_Prompt_v14  --data --filein file:Zmu_rawreco_2016H.root --era Run2_2016 --fileout test.root --eventcontent=RECO --datatier RAW
cmsDriver.py reco -s RAW2DIGI,RECO --conditions=92X_dataRun2_Prompt_v11  --data --filein file:../../inputRoot/0026F566-83BB-E711-B677-7845C4FC3683.root --era Run2_2017 --fileout test.root --eventcontent=RECO --inputCommands "keep *","drop *_*_*_RECO" --processName=reRECO -n 10

