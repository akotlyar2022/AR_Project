//
//  ViewController.swift
//  AR_Project
//
//  Created by macbook on 10.01.23.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        sceneView.autoenablesDefaultLighting = true
        
        let scene = SCNScene()
        createBox(in: scene)
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(boxTapped(touch:)))
        self.sceneView.addGestureRecognizer(gestureRecognizer)

        
        // create object - box
//        let boxGeometry = SCNBox(width: 0.3, height: 0.3, length: 0.3, chamferRadius: 0)
//        let material = SCNMaterial()
//        material.diffuse.contents = UIColor.red
//
//        let boxNode = SCNNode(geometry: boxGeometry)
//        boxNode.geometry?.materials = [material]
//        boxNode.position = SCNVector3(0, 0, -1.0)
//
//        scene.rootNode.addChildNode(boxNode)
        
        // create object - text
//        let textGeometry = SCNText(string: "CUBE", extrusionDepth: 2.0)
//        let textMaterial = SCNMaterial()
//        textMaterial.diffuse.contents = UIColor.yellow
        
//        textGeometry.firstMaterial?.diffuse.contents - another variant
        
//        let textNode = SCNNode(geometry: textGeometry)
//        textNode.scale = SCNVector3(0.005, 0.005, 0.005)
//        textNode.geometry?.materials = [textMaterial]
//
//        textNode.position = SCNVector3(0, 0.2, -1.0)
//        scene.rootNode.addChildNode(textNode)
       
        // create object - sphere
//        let sphereGeometry = SCNSphere(radius: 0.2)
//        let sphereMaterial = SCNMaterial()
//
//        sphereMaterial.diffuse.contents = UIImage(named: "earth.jpg")
//        sphereMaterial.diffuse.contentsTransform = SCNMatrix4MakeScale(2, 2, 2)
//        let sphereNode = SCNNode(geometry: sphereGeometry)
//        sphereNode.geometry?.materials = [sphereMaterial]
//        sphereNode.position = SCNVector3(0, 0, -1)
//        scene.rootNode.addChildNode(sphereNode)
//
        
        
        sceneView.scene = scene
    }
    
//    private func createFigures(in scene: SCNScene) {
//        let array: [SCNGeometry] = [SCNPlane(), SCNSphere(), SCNBox(), SCNPyramid(), SCNTube(), SCNCone(), SCNTorus(), SCNCylinder(), SCNCapsule()]
//
//        var xCoordinate: Double = 1
//        sceneView.autoenablesDefaultLighting = true
//
//        for geometryShape in array {
//            let node = SCNNode(geometry: geometryShape)
//
//            let material = SCNMaterial()
//            material.diffuse.contents = UIColor.red
//
//            node.geometry?.materials = [material]
//            node.scale = SCNVector3(0.1, 0.1, 0.1)
//
//            node.position = SCNVector3(xCoordinate, 0, -1)
//            xCoordinate -= 0.2
//
//            scene.rootNode.addChildNode(node)
//        }
//    }
    
    @objc func boxTapped(touch: UITapGestureRecognizer) {
        let sceneView = touch.view as! SCNView
        let touchLocation = touch.location(in: sceneView)
        
        let touchResults = sceneView.hitTest(touchLocation)
        
        guard touchResults.isEmpty, let node = touchResults.first?.node else { return }
        let boxMaterial = SCNMaterial()
        boxMaterial.diffuse.contents = UIColor.blue
        boxMaterial.specular.contents = UIColor.orange
        node.geometry?.materials[0] = boxMaterial
    }
    
    
    private func createBox(in scene: SCNScene) {
        let box = SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0)
        let boxMaterial = SCNMaterial()
        
        boxMaterial.diffuse.contents = UIColor.blue
        boxMaterial.specular.contents = UIColor.yellow
        
        let boxNode = SCNNode(geometry: box)
        boxNode.geometry?.materials = [boxMaterial]
        boxNode.position = SCNVector3(0.0, 0.0, -1.0)
        scene.rootNode.addChildNode(boxNode)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
}
