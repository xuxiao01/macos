//
//  AppDelegate.swift
//  mac-os-a
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
        MSAppCenter.start("65e5567b-148c-465f-ad5b-bbbaebc891a5", withServices:[
            MSAnalytics.self,
            MSCrashes.self,
            MSPush.self
            ])
       
        
        // Insert code here to initialize your application
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    
    
}
