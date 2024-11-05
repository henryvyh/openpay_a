import UIKit
import OpenpayKit

@objc(OpenpayA)
class OpenpayA: NSObject {
    let MERCHANT_ID = "m3cji4ughukthjcsglv0"
    let API_KEY = "pk_041b934cacef4780929cc7a3d21d1403"
  var openpay : Openpay!

    
  @objc(multiply:withB:withResolver:withRejecter:)
  func multiply(a: Float, b: Float, resolve: @escaping RCTPromiseResolveBlock,reject: @escaping RCTPromiseRejectBlock) -> Void {
    //
     openpay = Openpay(withMerchantId: MERCHANT_ID, 
                          andApiKey: API_KEY, 
                          isProductionMode: false, 
                          isDebug: true, 
                          countryCode: "PE")
    // openpay = Openpay(withMerchantId:  "mpexlotmiibzxkfe6xnd", andApiKey:  "pk_cd389917fd08455c993a7460382d9dc1", isProductionMode:  false, isDebug: true,countryCode: "MX")
    //  print("OpenpayKit")
     NSLog("Generated Device Session ID:\(MERCHANT_ID)")  // Log to console
     NSLog("Generated Device Session ID:\(API_KEY)")  // Log to console
     NSLog("Generated Device Session ID:\(openpay)")  // Log to console
     NSLog("Generated Device Session ID:\(openpay.createDeviceSessionId)")  // Log to console
    //  openpay.createDeviceSessionId(successFunction: successSessionID, failureFunction: failSessionID)
    //lib
    //  openpay.createDeviceSessionId { sessionId in
    //     NSLog("Generated Device Session ID: \(sessionId)")  // Log to console
    //     // resolve(sessionId)
    // } failureFunction: { error in
    //     NSLog("Failed to generate session ID, error code:")  // Log the error code
    //     // reject("ERROR_CODE", "Failed to create session ID", error)
    // }
    //
    openpay.createDeviceSessionId { sessionId in
            NSLog("Generated Device Session ID: \(sessionId)")
            // resolve(a*b) // Return session ID to JavaScript
        } failureFunction: { error in
            NSLog("Failed to generate session ID, error code: \(error)")
            // reject("ERROR_CODE", "Failed to create session ID", error) // Return error to JavaScript
        }
    // openpay.createDeviceSessionId(successFunction: successSessionID, failureFunction: failSessionID)

    resolve(a*b)
  }

  func successSessionID(sessionID: String) {
        NSLog("SessionID: \(sessionID)")
}

func failSessionID(error: NSError) {
        NSLog("\(error.code) - \(error.localizedDescription)")
}

}
