//
//  GameViewController.swift
//  PlanetTest
//
//  Created by Dan Lindsay on 2017-04-25.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {
    
    var sceneView: SCNView?
    let scene = PlanetScene(create: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView = self.view as? SCNView
        if let view = sceneView {
            
            view.scene = scene
            view.isPlaying = true
            view.backgroundColor = UIColor.black
            view.allowsCameraControl = true
            view.antialiasingMode = SCNAntialiasingMode.multisampling4X
            
        }
        
    }
    
    override var shouldAutorotate : Bool {
        return true
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
}
