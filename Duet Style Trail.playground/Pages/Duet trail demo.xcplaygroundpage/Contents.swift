//: Setup code for Playground View
import Foundation
import SpriteKit
import XCPlayground
let view = SKView(frame: NSRect(x: 0, y: 0, width: 320, height: 568))
let scene = SKScene(size: CGSize(width: 320, height: 568))
view.presentScene(scene)
XCPlaygroundPage.currentPage.liveView = view

//: Create `spinNode` to hold and rotate both players
let spinNode = SKNode()
spinNode.position = CGPoint(x: 160, y: 284)
scene.addChild(spinNode)

//: Create red player, add to spinNode on left
let redPlayer = SKSpriteNode(color: SKColor.redColor(), size: CGSize(width: 0, height: 0))
redPlayer.position = CGPoint(x: -120, y: 0)
spinNode.addChild(redPlayer)

//: Create red trail, add as child of red player and set `targetNode` to scene so particles are left behind as it moves
let redTrail = SKEmitterNode(fileNamed: "Red")!
redTrail.targetNode = scene
redPlayer.addChild(redTrail)

//: Create blue player, add to spinNode on right
let blueNode = SKSpriteNode(color: SKColor.blueColor(), size: CGSize(width: 0, height: 0))
blueNode.position = CGPoint(x: 120, y: 0)
spinNode.addChild(blueNode)

//: Create blue trail, add as child of blue player and set `targetNode` to scene so particles are left behind as it moves
let blueTrail = SKEmitterNode(fileNamed: "Blue")!
blueTrail.targetNode = scene
blueNode.addChild(blueTrail)

//: Animate rotation of `spinNode` for live view preview
let rotate = SKAction.rotateByAngle(CGFloat(M_PI * 3 / 2), duration: 3)
let reverse = rotate.reversedAction()
let wait = SKAction.waitForDuration(1)
let sequence = SKAction.sequence([rotate, wait, reverse, wait])
spinNode.runAction(SKAction.repeatActionForever(sequence))
