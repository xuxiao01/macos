//
//  ViewController.swift
//  mac-os-a
//
//  Created by bys on 23/11/2017.
//  Copyright © 2017 bys. All rights reserved.
//

import Cocoa
import SpriteKit
import GameplayKit


class ViewController: NSViewController {

    @IBOutlet weak var helloLabel: NSTextField!
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
    

}

