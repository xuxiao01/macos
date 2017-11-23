//
//  ViewController.swift
//  macoshello
//
//  Created by bys on 23/11/2017.
//  Copyright © 2017 bys. All rights reserved.
//

import Cocoa
import SpriteKit
import GameplayKit
import AppCenterCrashes

class ViewController: NSViewController {

    @IBOutlet weak var nameLabel: NSTextField!
    @IBOutlet weak var nameField: NSTextField!
    @IBOutlet var skView: SKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let view = self.skView {
            
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    @IBAction func sayHelloClicked(_ sender: NSButton) {
        var name = nameField.stringValue
        if name.isEmpty{
            name = "Word"
            MSCrashes.generateTestCrash()
        }
        let greeting = "Hello \(name)!"
        nameLabel.stringValue = greeting
        
        
    }
}

