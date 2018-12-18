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
//		model.command(action: .addPathNode(at: GP(2, 1)), time: 1.125)
//		model.command(action: .addShapeNode(at: GP(2, 1)), time: 1.25)
//		model.command(action: .addPathNode(at: GP(2, 2)), time: 1.0625)
//		model.command(action: .addPathNode(at: GP(2, 3)), time: 1.25)
//		model.command(action: .addPathNode(at: GP(3, 3)), time: 2.5)
//		model.command(action: .addPathNode(at: GP(4, 3)), time: 5.75)
		model.command(action: .addPathNode(at: GP(1, 1)), time: 0.50)
		model.command(action: .addShapeNode(at: GP(1, 1)), time: 0.75)
		model.command(action: .addPathNode(at: GP(1, 2)), time: 0.625)
		model.command(action: .addShapeNode(at: GP(1, 2)), time: 0.75)
		model.command(action: .addPathNode(at: GP(2, 2)), time: 1.625)
		model.command(action: .addPathNode(at: GP(2, 1)), time: 1.75)
		model.command(action: .addPathNode(at: GP(3, 2)), time: 3.625)
		model.command(action: .addPathNode(at: GP(3, 1)), time: 3.75)
		controller.dataReader = model.dateReader
		controller.model = model
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
	
}
