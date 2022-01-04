
"use strict";

let ListMaps = require('./ListMaps.js')
let GetAnnotations = require('./GetAnnotations.js')
let DeleteMap = require('./DeleteMap.js')
let SaveAnnotationsData = require('./SaveAnnotationsData.js')
let SetKeyword = require('./SetKeyword.js')
let PubAnnotationsData = require('./PubAnnotationsData.js')
let EditAnnotationsData = require('./EditAnnotationsData.js')
let YAMLImport = require('./YAMLImport.js')
let PublishMap = require('./PublishMap.js')
let ListWorlds = require('./ListWorlds.js')
let ResetDatabase = require('./ResetDatabase.js')
let GetAnnotationsData = require('./GetAnnotationsData.js')
let SaveMap = require('./SaveMap.js')
let RenameMap = require('./RenameMap.js')
let DeleteAnnotations = require('./DeleteAnnotations.js')
let SetRelationship = require('./SetRelationship.js')
let YAMLExport = require('./YAMLExport.js')

module.exports = {
  ListMaps: ListMaps,
  GetAnnotations: GetAnnotations,
  DeleteMap: DeleteMap,
  SaveAnnotationsData: SaveAnnotationsData,
  SetKeyword: SetKeyword,
  PubAnnotationsData: PubAnnotationsData,
  EditAnnotationsData: EditAnnotationsData,
  YAMLImport: YAMLImport,
  PublishMap: PublishMap,
  ListWorlds: ListWorlds,
  ResetDatabase: ResetDatabase,
  GetAnnotationsData: GetAnnotationsData,
  SaveMap: SaveMap,
  RenameMap: RenameMap,
  DeleteAnnotations: DeleteAnnotations,
  SetRelationship: SetRelationship,
  YAMLExport: YAMLExport,
};
