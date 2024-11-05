package com.openpaya

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise
import mx.openpay.android.Openpay

class OpenpayAModule(reactContext: ReactApplicationContext) :
  ReactContextBaseJavaModule(reactContext) {

  override fun getName(): String {
    return NAME
  }

  // Example method
  // See https://reactnative.dev/docs/native-modules-android
  @ReactMethod
  fun multiply(a: Double, b: Double, promise: Promise) {
    val openpay = Openpay("mpexlotmiibzxkfe6xnd", "pk_cd389917fd08455c993a7460382d9dc1", false)
    val activity = reactApplicationContext.currentActivity
    val deviceSessionId = openpay.deviceCollectorDefaultImpl.setup(activity)
    println("Device session id: $deviceSessionId")
    promise.resolve(deviceSessionId)
  }

  companion object {
    const val NAME = "OpenpayA"
  }
}
