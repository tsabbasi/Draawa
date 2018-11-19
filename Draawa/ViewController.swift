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
    var startingPoint = CGPoint.zero
    var lineContinuous = false
    
    
    // getting location of starting point
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        lineContinuous = false
        startingPoint = touch.location(in: view)
    }
    
    
    func drawLine(from startPoint: CGPoint, to endPoint: CGPoint) {
        
//        let renderer = UIGraphicsImageRenderer
//        UIGraphicsBeginImageContext(view.frame.size)
        UIGraphicsBeginImageContextWithOptions(view.frame.size, false, 0.0)
        
        // unwrapping optional
        // getting
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
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        lineContinuous = true
        let currentPoint = touch.location(in: view)
        drawLine(from: startingPoint, to: currentPoint)

        startingPoint = currentPoint
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // when user taps screen - draw a point
        if !lineContinuous {
            drawLine(from: startingPoint, to: startingPoint)
        }
    }

    
    
    @IBAction func colorSelected(_ sender: UIButton) {
        guard let selectedColor = ColorPalette(tag: sender.tag) else {
            return
        }
        
        lineColor = selectedColor.color
    }
  
    @IBAction func clearDraawa(_ sender: Any) {
        draawaImageView.image = nil
    }
    
//    @IBAction func colorSelected(_ sender: UIButton) {
//        guard let selectedColor = ColorPalette(tag: sender.tag) else {
//            return
//        }
//
//        lineColor = selectedColor.color
//
//    }
    
    
    
    

    
    
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

