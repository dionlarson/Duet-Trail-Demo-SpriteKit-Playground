//: ## Setup code for Playground View
import Foundation
import SpriteKit
import PlaygroundSupport
let view = SKView(frame: NSRect(x: 0, y: 0, width: 320, height: 568))
view.wantsLayer = true // fix for Playgrounds in Xcode 7.3
let scene = SKScene(size: CGSize(width: 320, height: 568))
view.presentScene(scene)
PlaygroundPage.current.liveView = view

//: ## Create `spinNode` to hold and rotate both players
let spinNode = SKNode()
spinNode.position = CGPoint(x: 160, y: 284)
scene.addChild(spinNode)

//: ## Create red player, add to spinNode on left
let redPlayer = SKSpriteNode(color: SKColor.red, size: CGSize(width: 0, height: 0))
redPlayer.position = CGPoint(x: -120, y: 0)
spinNode.addChild(redPlayer)

//: ## Create red trail, add as child of red player and set `targetNode` to scene so particles are left behind as it moves
let redTrail = SKEmitterNode(fileNamed: "Red")!
redTrail.targetNode = scene
redPlayer.addChild(redTrail)

//: ## Create blue player, add to spinNode on right
let bluePlayer = SKSpriteNode(color: SKColor.blue, size: CGSize(width: 0, height: 0))
bluePlayer.position = CGPoint(x: 120, y: 0)
spinNode.addChild(bluePlayer)

//: ## Create blue trail, add as child of blue player and set `targetNode` to scene so particles are left behind as it moves
let blueTrail = SKEmitterNode(fileNamed: "Blue")!
blueTrail.targetNode = scene
bluePlayer.addChild(blueTrail)

//: ## Animate rotation of `spinNode` for live view preview
let rotate = SKAction.rotate(byAngle: CGFloat(Double.pi * 3 / 2), duration: 3)
let reverse = rotate.reversed()
let wait = SKAction.wait(forDuration: 1)
let sequence = SKAction.sequence([rotate, wait, reverse, wait])
spinNode.run(SKAction.repeatForever(sequence))
