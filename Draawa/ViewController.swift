//
//  ViewController.swift
//  Draawa
//
//  Created by Tuba Abbasi on 11/17/18.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var draawaImageView: UIImageView!
    
    // buttons
    
    
    var lineColor = UIColor.black
    var lineWidth:CGFloat = 10
    var touchPoint = CGPoint.zero
    var swiped = false
    //    var path:UIBezierPath!
//    var startingPoint:CGPoint!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        swiped = false
        touchPoint = touch.location(in: view)
    }
    
    func drawLine(from startPoint: CGPoint, to endPoint: CGPoint) {
        // 1
        UIGraphicsBeginImageContext(view.frame.size)
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        draawaImageView.image?.draw(in: view.bounds)
        
        context.move(to: startPoint)
        context.addLine(to: endPoint)

        context.setLineCap(.round)
        context.setBlendMode(.normal)
        context.setLineWidth(lineWidth)
        context.setStrokeColor(lineColor.cgColor)
        
        context.strokePath()
        
        draawaImageView.image = UIGraphicsGetImageFromCurrentImageContext()
//        tempImageView.alpha = opacity
        UIGraphicsEndImageContext()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        swiped = true
        let currentPoint = touch.location(in: view)
        drawLine(from: touchPoint, to: currentPoint)
        
        // 7 ---> change variable name
        touchPoint = currentPoint
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
            // draw a single point
            drawLine(from: touchPoint, to: touchPoint)
        }
    }
    
    
    @IBAction func colorSelected(_ sender: UIButton) {
        guard let selectedColor = ColorPalette(tag: sender.tag) else {
            return
        }
        
        lineColor = selectedColor.color

    }
    
    
    
    

    
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    
    
}

