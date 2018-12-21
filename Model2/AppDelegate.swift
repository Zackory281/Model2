//
//  AppDelegate.swift
//  Model2
//
//  Created by Zackory Cramer on 11/29/18.
//  Copyright © 2018 Zackori Cui. All rights reserved.
//


import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
	
	//applicationDidlau
	func applicationWillFinishLaunching(_ notification: Notification) {
		// Insert code here to initialize your application
//		let controller = NSApplication.shared.mainWindow!.contentViewController as! NodeSceneViewController
//		controller.model = model
	}
    func applicationDidFinishLaunching(_ aNotification: Notification) {
		//NSApplication.shared.mainWindow!.acceptsMouseMovedEvents = true
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
	
}
