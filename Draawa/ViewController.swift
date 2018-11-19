//
//  ViewController.swift
//  Draawa
//
//  Created by Tuba Abbasi on 11/17/18.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var draawaImageView: UIImageView!
    
    var lineColor = UIColor(red:0.12, green:0.12, blue:0.12, alpha:1.0)
    var lineWidth:CGFloat = 10
    var startingPoint = CGPoint.zero
    var lineContinuous = false
    
    
    // getting location of initial touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        lineContinuous = false
        startingPoint = touch.location(in: view)
    }
    
    
    // allows to draw lines along the defined path
    func drawLine(from startPoint: CGPoint, to endPoint: CGPoint) {
        UIGraphicsBeginImageContextWithOptions(view.frame.size, false, 0.0)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        draawaImageView.image?.draw(in: view.bounds)
        
        context.move(to: startPoint)
        context.addLine(to: endPoint)

        context.setLineCap(.round)
        context.setLineWidth(lineWidth)
        context.setStrokeColor(lineColor.cgColor)
        
        context.strokePath()
        draawaImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    
    // when user drags finger on screen - draw continuous lines to follow finger movements
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        lineContinuous = true
        let currentPoint = touch.location(in: view)
        drawLine(from: startingPoint, to: currentPoint)
        startingPoint = currentPoint
    }
    
    
    // when user lifts finger - draw a point if line is not continous
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !lineContinuous {
            drawLine(from: startingPoint, to: startingPoint)
        }
    }

    
    // update color according to user color selection from palette
    @IBAction func colorSelected(_ sender: UIButton) {
        guard let selectedColor = ColorPalette(tag: sender.tag) else {
            return
        }
        lineColor = selectedColor.color
    }
  
    
    // clear drawings on screen
    @IBAction func clearDraawa(_ sender: Any) {
        draawaImageView.image = nil
    }
}

