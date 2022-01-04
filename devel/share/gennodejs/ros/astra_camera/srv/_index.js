
"use strict";

let SetUVCGain = require('./SetUVCGain.js')
let SetIRGain = require('./SetIRGain.js')
let GetDeviceType = require('./GetDeviceType.js')
let ResetIRGain = require('./ResetIRGain.js')
let ResetIRExposure = require('./ResetIRExposure.js')
let GetIRGain = require('./GetIRGain.js')
let SetIRExposure = require('./SetIRExposure.js')
let GetSerial = require('./GetSerial.js')
let SetIRFlood = require('./SetIRFlood.js')
let GetCameraInfo = require('./GetCameraInfo.js')
let SetUVCExposure = require('./SetUVCExposure.js')
let GetUVCGain = require('./GetUVCGain.js')
let GetUVCExposure = require('./GetUVCExposure.js')
let SetLDP = require('./SetLDP.js')
let GetUVCWhiteBalance = require('./GetUVCWhiteBalance.js')
let SetLaser = require('./SetLaser.js')
let SetUVCWhiteBalance = require('./SetUVCWhiteBalance.js')
let SwitchIRCamera = require('./SwitchIRCamera.js')
let GetIRExposure = require('./GetIRExposure.js')

module.exports = {
  SetUVCGain: SetUVCGain,
  SetIRGain: SetIRGain,
  GetDeviceType: GetDeviceType,
  ResetIRGain: ResetIRGain,
  ResetIRExposure: ResetIRExposure,
  GetIRGain: GetIRGain,
  SetIRExposure: SetIRExposure,
  GetSerial: GetSerial,
  SetIRFlood: SetIRFlood,
  GetCameraInfo: GetCameraInfo,
  SetUVCExposure: SetUVCExposure,
  GetUVCGain: GetUVCGain,
  GetUVCExposure: GetUVCExposure,
  SetLDP: SetLDP,
  GetUVCWhiteBalance: GetUVCWhiteBalance,
  SetLaser: SetLaser,
  SetUVCWhiteBalance: SetUVCWhiteBalance,
  SwitchIRCamera: SwitchIRCamera,
  GetIRExposure: GetIRExposure,
};
