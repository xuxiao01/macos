//
//  AppDelegate.swift
//  macoshello
//
//  Created by bys on 23/11/2017.
//  Copyright © 2017 bys. All rights reserved.
//


import Cocoa
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes
import AppCenterPush

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate,MSCrashesDelegate,MSPushDelegate {
    
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        MSAppCenter.setLogUrl("https://in-staging-south-centralus.staging.avalanch.es")
        MSCrashes.setDelegate(self)
        MSPush.setDelegate(self)
        MSAppCenter.start("2e023a1a-3dcc-4075-b0f0-77460fe475f7", withServices:[
            MSAnalytics.self,
            MSCrashes.self,
            MSPush.self
            ])
        MSAnalytics.setEnabled(true)
        MSAnalytics.trackEvent("Video clicked")
        MSAnalytics.trackEvent("didMove")
        MSAnalytics.trackEvent("mouseUp")
        MSAnalytics.trackEvent("keyDown")
        MSAnalytics.trackEvent("launch");
        MSAppCenter.setLogLevel(MSLogLevel.verbose)
        //var installId = MSAppCenter.installId()
        
        let customProperties = MSCustomProperties()
        customProperties.setString("blue", forKey: "color")
        customProperties.setNumber(10, forKey: "score")
        customProperties.clearProperty(forKey: "score")
        MSAppCenter.setCustomProperties(customProperties)
        
        // Insert code here to initialize your application
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func application(_ application: NSApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        // Pass the device token to MSPush.
        MSPush.didRegisterForRemoteNotifications(withDeviceToken: deviceToken)
    }
    
    func application(_ application: NSApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        
        // Pass the error to MSPush.
        MSPush.didFailToRegisterForRemoteNotificationsWithError(error)
    }
    func application(_ application: NSApplication, didReceiveRemoteNotification userInfo: [String : Any]) {
        MSPush.didReceiveRemoteNotification(userInfo)
    }
    func attachments(with crashes: MSCrashes, for errorReport: MSErrorReport) -> [MSErrorAttachmentLog] {
        let attachment1 = MSErrorAttachmentLog.attachment(withText: "Hello world!", filename: "hello.txt")
        let attachment2 = MSErrorAttachmentLog.attachment(withBinary: "Fake image".data(using: String.Encoding.utf8), filename: nil, contentType: "image/jpeg")
        return [attachment1!, attachment2!]
    }
    
    
    func push(_ push: MSPush!, didReceive pushNotification: MSPushNotification!) {
        let alert: NSAlert = NSAlert()
        alert.messageText = "Sorry about that!"
        alert.informativeText = "Do you want to send an anonymous crash report so we can fix the issue?"
        alert.addButton(withTitle: "Always send")
        alert.addButton(withTitle: "Send")
        alert.addButton(withTitle: "Don't send")
        
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
    
}

