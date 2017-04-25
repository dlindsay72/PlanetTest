//
//  PlanetScene.swift
//  PlanetTest
//
//  Created by Dan Lindsay on 2017-04-25.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class PlanetScene: SCNScene {
    
    convenience init(create: Bool) {
        self.init()
        
        setupLightsAndCamera()
        
        //ADD CODE AFTER THIS
        /////////////////////
        
        let material = SCNMaterial()
        let planetGeometry = SCNSphere(radius: 0.5)
        
        planetGeometry.firstMaterial = material
        
        let planetNode = SCNNode(geometry: planetGeometry)
        
        planetNode.runAction(SCNAction.repeatForever(SCNAction.rotate(by: CGFloat(2 * Double.pi), around: SCNVector3(0, 1, 0), duration: 20)))
        rootNode.addChildNode(planetNode)
        
        
    }
    
    
    
    func setupLightsAndCamera() {
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.camera!.usesOrthographicProjection = false
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 0)
        cameraNode.pivot = SCNMatrix4MakeTranslation(0, 0, -2)
        
        let lightNodeSpot = SCNNode()
        lightNodeSpot.light = SCNLight()
        lightNodeSpot.light!.type = SCNLight.LightType.spot
        lightNodeSpot.light!.attenuationStartDistance = 2.0
        lightNodeSpot.light!.attenuationFalloffExponent = 2
        lightNodeSpot.light!.attenuationEndDistance = 100
        lightNodeSpot.position = SCNVector3(x: 0, y: 2, z: 1)
        
        let light = SCNLight()
        light.type = SCNLight.LightType.ambient
        
        ///////////////AMBIENT LIGHT COLOR
        
        light.color = UIColor.black
        //light.color = UIColor.white
        
        //////////////////////////////////
        
        let ambiLight = SCNNode()
        ambiLight.light = light
        ambiLight.position = SCNVector3(x: -2, y: -2, z: 0)
        
        let emptyAtCenter = SCNNode()
        emptyAtCenter.position = SCNVector3(x: 0, y: -1, z: 0.5)
        rootNode.addChildNode(emptyAtCenter)
        
        lightNodeSpot.constraints = [SCNLookAtConstraint(target: emptyAtCenter)]
        
        rootNode.addChildNode(ambiLight)
        rootNode.addChildNode(cameraNode)
        rootNode.addChildNode(lightNodeSpot)
    }
    
}
