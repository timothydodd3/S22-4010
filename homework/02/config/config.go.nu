  1: package config
  2: 
  3: import (
  4:     "encoding/json"
  5:     "io/ioutil"
  6: )
  7: 
  8: // GlobalConfigData is the gloal configuration data.
  9: // It holds all the data from the cfg.json file.
 10: type GlobalConfigData struct {
 11:     DataDir          string
 12:     MiningDifficulty string
 13: }
 14: 
 15: var gCfg GlobalConfigData // global configuration data.
 16: 
 17: // ReadConfig will read a configuration file into the global congiguration structure.
 18: func ReadConfig(filename string) (err error) {
 19:     // Create Defaults
 20:     gCfg.MiningDifficulty = "0000"
 21: 
 22:     var buf []byte
 23:     buf, err = ioutil.ReadFile(filename)
 24:     if err != nil {
 25:     }
 26:     err = json.Unmarshal(buf, &gCfg)
 27:     if err != nil {
 28:     }
 29:     return err
 30: }
 31: 
 32: // GetGlobalConfig returns a copy of the global config structure.
 33: func GetGlobalConfig() (rv GlobalConfigData) {
 34:     return gCfg
 35: }
