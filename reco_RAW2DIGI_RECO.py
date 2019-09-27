# Auto generated configuration file
# using: 
# Revision: 1.19 
# Source: /local/reps/CMSSW/CMSSW/Configuration/Applications/python/ConfigBuilder.py,v 
# with command line options: reco -s RAW2DIGI,RECO --conditions=92X_dataRun2_Prompt_v11 --data --filein file:../../../inputRoot/0026F566-83BB-E711-B677-7845C4FC3683.root --era Run2_2017 --fileout test.root --eventcontent=RECO --inputCommands keep *,drop *_*_*_RECO --processName=reRECO -n 10
import FWCore.ParameterSet.Config as cms

from Configuration.StandardSequences.Eras import eras

process = cms.Process('reRECO',eras.Run2_2017)

# import of standard configurations
process.load('Configuration.StandardSequences.Services_cff')
process.load('SimGeneral.HepPDTESSource.pythiapdt_cfi')
process.load('FWCore.MessageService.MessageLogger_cfi')
process.load('Configuration.EventContent.EventContent_cff')
process.load('Configuration.StandardSequences.GeometryRecoDB_cff')
process.load('Configuration.StandardSequences.MagneticField_AutoFromDBCurrent_cff')
process.load('Configuration.StandardSequences.RawToDigi_Data_cff')
process.load('Configuration.StandardSequences.Reconstruction_Data_cff')
process.load('Configuration.StandardSequences.EndOfProcess_cff')
process.load('Configuration.StandardSequences.FrontierConditions_GlobalTag_cff')

process.maxEvents = cms.untracked.PSet(
    input = cms.untracked.int32(1000)
)

# Input source
pickEvent = '299481:498400158'
process.source = cms.Source("PoolSource",
    dropDescendantsOfDroppedBranches = cms.untracked.bool(False),
#    fileNames = cms.untracked.vstring('file:/raid/raid8/mhl/CSC_Run2/rootMaker_Run2/CMSSW_9_2_13/src/00E68DCF-E3B2-E711-910F-48FD8EE73A03.root'),
#    fileNames = cms.untracked.vstring('file:../../inputRoot/0014C2C5-92BA-E711-ADD1-008CFAFBE8F2.root'),
    fileNames = cms.untracked.vstring('file:../../inputRoot/0026F566-83BB-E711-B677-7845C4FC3683.root'),
#    eventsToProcess = cms.untracked.VEventRange(pickEvent + '-' + pickEvent),
#    inputCommands = cms.untracked.vstring('keep *', 
#        'drop *CSCWireHit*_*_*_reRECO', 'drop *CSCStripHit*_*_*_reRECO'),
    secondaryFileNames = cms.untracked.vstring()
)

process.options = cms.untracked.PSet(

)

# Production Info
process.configurationMetadata = cms.untracked.PSet(
    annotation = cms.untracked.string('reco nevts:10'),
    name = cms.untracked.string('Applications'),
    version = cms.untracked.string('$Revision: 1.19 $')
)

# Output definition

process.RECOoutput = cms.OutputModule("PoolOutputModule",
    dataset = cms.untracked.PSet(
        dataTier = cms.untracked.string(''),
        filterName = cms.untracked.string('')
    ),
    eventAutoFlushCompressedSize = cms.untracked.int32(5242880),
    fileName = cms.untracked.string('../../outputRoot/test2.root'),
    outputCommands = process.RECOEventContent.outputCommands,
    splitLevel = cms.untracked.int32(0)
)

# Additional output definition

# Other statements
from Configuration.AlCa.GlobalTag import GlobalTag
process.GlobalTag = GlobalTag(process.GlobalTag, '92X_dataRun2_Prompt_v11', '')

# Path and EndPath definitions
process.raw2digi_step = cms.Path(process.RawToDigi)
#process.raw2digi_step = cms.Path(process.muonCSCDigis*process.gtDigis)

#process.reconstruction_step = cms.Path(process.reconstruction)
process.reconstruction_step = cms.Path(process.muonCSCDigis\
                                      *process.gtDigis\
                                      *process.csc2DRecHits\
                                      *process.cscSegments)
process.endjob_step = cms.EndPath(process.endOfProcess)
process.RECOoutput_step = cms.EndPath(process.RECOoutput)

# Schedule definition
#process.schedule = cms.Schedule(process.raw2digi_step,process.reconstruction_step,process.endjob_step,process.RECOoutput_step)
process.schedule = cms.Schedule(process.reconstruction_step,process.endjob_step,process.RECOoutput_step)
from PhysicsTools.PatAlgos.tools.helpers import associatePatAlgosToolsTask
associatePatAlgosToolsTask(process)


# Customisation from command line

# Add early deletion of temporary data products to reduce peak memory need
#from Configuration.StandardSequences.earlyDeleteSettings_cff import customiseEarlyDelete
#process = customiseEarlyDelete(process)
# End adding early deletion
