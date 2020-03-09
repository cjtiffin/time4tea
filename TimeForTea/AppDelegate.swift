//
//  AppDelegate.swift
//  TimeForTea
//
//  Created by Chris Tiffin on 09/03/2020.
//  Copyright © 2020 Chris Tiffin. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSUserNotificationCenterDelegate {
    
    var window: NSWindow!
    
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        //        // Create the SwiftUI view that provides the window contents.
        //        let contentView = ContentView()
        //
        //        // Create the window and set the content view.
        //        window = NSWindow(
        //            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
        //            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
        //            backing: .buffered, defer: false)
        //        window.center()
        //        window.setFrameAutosaveName("Main Window")
        //        window.contentView = NSHostingView(rootView: contentView)
        //        window.makeKeyAndOrderFront(nil)
        showNotification()
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func showNotification(delay: Int = 5) -> Void {
        let notification = NSUserNotification()
        notification.title = "Time For Tea"
        notification.subtitle = "Go and take a tea break"
        notification.deliveryDate = Date(timeIntervalSinceNow: TimeInterval(delay * 1))
        // need to set image
        notification.hasActionButton = true
        notification.actionButtonTitle = "2 mins"
        notification.otherButtonTitle = "Done"
        
        let center = NSUserNotificationCenter.default
        center.delegate = self
        center.scheduleNotification(notification)
    }
    
    func userNotificationCenter(_ center: NSUserNotificationCenter, didActivate notification: NSUserNotification) {
        showNotification(delay:2)
        print("2 min clicked")
    }
    
    @objc
    private func userNotificationCenter(_ center: NSUserNotificationCenter, didDismissAlert notification: NSUserNotification) {
        showNotification()
        print("Done clicked")
    }
    
    func userNotificationCenter(_ center: NSUserNotificationCenter, shouldPresent notification: NSUserNotification) -> Bool {
        return true
    }
}

