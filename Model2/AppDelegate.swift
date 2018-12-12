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
	
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
		let controller = NSApplication.shared.mainWindow!.contentViewController as! NodeSceneViewController
		let setting = ModelSetting(xi: -100, yi: -100, xf: 100, yf: 100)
		let model = Model(setting: setting)
		controller.dataReader = model.dateReader
		model.command(action: .addPathNode(at: GP(0, 0)))
		model.command(action: .addShapeNode(at: GP(0, 0)))
		controller.model = model
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    
}
