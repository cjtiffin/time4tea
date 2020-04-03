//
//  AppDelegate.swift
//  TimeForTea
//
//  Created by Chris Tiffin on 09/03/2020.
//  Copyright © 2020 Chris Tiffin. All rights reserved.
//

// todo
// - remove menu bars & content view
// - add tray icon
// - add image to notification
// - cancel scheduled notifications on exit
// - handle click on notification
// - prevent notification click from launching app

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSUserNotificationCenterDelegate {
    
    var notificationCenter: NSUserNotificationCenter!
    var notification: NSUserNotification!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        notification = NSUserNotification()
        notification.title = "Time For Tea"
        notification.subtitle = "Go and take a tea break"
        
        notification.hasActionButton = true
        notification.actionButtonTitle = "2 mins"
        notification.otherButtonTitle = "Done"
        
        // need to set image
        
        notificationCenter = NSUserNotificationCenter.default
        notificationCenter.delegate = self
        
        scheduleNotification()
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
        notificationCenter.removeScheduledNotification(notification)
    }
    
    func scheduleNotification(delay: Int = 5) -> Void {
        notification.deliveryDate = Date(timeIntervalSinceNow: TimeInterval(delay * 1))
        print(notificationCenter.scheduledNotifications)
        notificationCenter.scheduleNotification(notification)
        print(notificationCenter.scheduledNotifications)
    }
    
    func userNotificationCenter(_ center: NSUserNotificationCenter, didActivate notification: NSUserNotification) {
        scheduleNotification(delay:10)
        print("2 min clicked")
    }
    
    @objc
    private func userNotificationCenter(_ center: NSUserNotificationCenter, didDismissAlert notification: NSUserNotification) {
        scheduleNotification()
        print("Done clicked")
    }
    
    func userNotificationCenter(_ center: NSUserNotificationCenter, shouldPresent notification: NSUserNotification) -> Bool {
        return true
    }
}

