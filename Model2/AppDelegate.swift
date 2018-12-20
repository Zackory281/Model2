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
		model.command(action: .addGeoemtryNode(type: .Gem, dir: .RIGHT, at: GP(-1, -3)), time: 0.125)
		model.command(action: .addGeoemtryNode(type: .Gem, dir: .UP, at: GP(1, 3)), time: 0.125)
		model.command(action: .addGeoemtryNode(type: .Square, dir: .UP, at: GP(4, -4)), time: 0.25)
		model.command(action: .addGeoemtryNode(type: .Triangle, dir: .UP, at: GP(-5, -1)), time: 0.25)
		model.command(action: .addGeoemtryNode(type: .Square, dir: .UP, at: GP(0, 0)), time: 1.5)
		model.command(action: .addGeoemtryNode(type: .Square, dir: .UP, at: GP(0, 0)), time: 1.5)
		model.command(action: .addGeoemtryNode(type: .Triangle_Small, dir: .DOWN, at: GP(2, -4)), time: 1.75)
		model.command(action: .addGeoemtryNode(type: .Z, dir: .UP, at: GP(4, -6)), time: 1.5)
		controller.dataReader = model.dataBase
		controller.model = model
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
	
}
