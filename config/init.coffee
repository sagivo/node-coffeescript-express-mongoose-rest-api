consts = require('./consts')
fs = require 'fs'

#load models
require  consts.MODELS_PATH+'/'+model for model in fs.readdirSync(consts.MODELS_PATH)	