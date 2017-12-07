//
//  AppDelegate.swift
//  macOS-Chao
//
//  Created by bys on 24/11/2017.
//  Copyright © 2017 bys. All rights reserved.
//

import Cocoa
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes
import AppCenterPush

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, MSPushDelegate, MSCrashesDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        MSPush.setDelegate(self)
        MSCrashes.setDelegate(self)
        MSAppCenter.setLogUrl("https://in-staging-south-centralus.staging.avalanch.es")
        MSAppCenter.start("2e023a1a-3dcc-4075-b0f0-77460fe475f7", withServices:[
            MSAnalytics.self,
            MSCrashes.self,
            MSPush.self
            ])
        MSAnalytics.trackEvent("Label")
        MSAnalytics.trackEvent("Say Hello Button")
        MSAppCenter.setLogLevel(MSLogLevel.verbose)
        var install = MSAppCenter.installId()
        
    }
   
    func push(_ push: MSPush!, didReceive pushNotification: MSPushNotification!) {
        let alert: NSAlert = NSAlert()
        alert.messageText = "Sorry about that!"
        alert.informativeText = "Do you want to send an anonymous crash report so we can fix the issue?"
        alert.addButton(withTitle: "Always send")
        alert.addButton(withTitle: "Send")
        alert.addButton(withTitle: "Don't send")
        //alert.alertStyle = NSWarningAlertStyle
        
        switch (alert.runModal()) {
        case NSApplication.ModalResponse.alertFirstButtonReturn:
            MSCrashes.notify(with: .always)
            break;
        case NSApplication.ModalResponse.alertSecondButtonReturn:
            MSCrashes.notify(with: .send)
            break;
        case NSApplication.ModalResponse.alertThirdButtonReturn:
            MSCrashes.notify(with: .dontSend)
            break;
        default:
            break;
        }
    }
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

