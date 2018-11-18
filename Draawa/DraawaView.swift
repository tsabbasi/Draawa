//
//  DraawaView.swift
//  Draawa
//
//  Created by Tuba Abbasi on 11/17/18.
//

import UIKit

class DraawaView: UIView {
    
    
    
//    var lastPoint = CGPoint.zero
//    var swiped = false
    // above are from another tutorial
    var lineColor:UIColor!
    var lineWidth:CGFloat!
    var path:UIBezierPath!
    var touchPoint:CGPoint!
    var startingPoint:CGPoint!
    
    override func layoutSubviews() {
        // prevent from drawing over address of this view
        self.clipsToBounds = true
        // only recognize one touch
        self.isMultipleTouchEnabled = false
        
        lineColor = UIColor.green
        lineWidth = 10
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // set starting point to location of first touch
        let touch = touches.first
        startingPoint = touch?.location(in: self)
    }
    
    // called when we start moving our finger on the screen
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        touchPoint = touch?.location(in: self)
        
        // drawing line from starting point (in touchesBegan)
        // to another point (everytime we move our finger across surface)
        path = UIBezierPath()
        path.move(to: startingPoint)
        path.addLine(to: touchPoint)
        // change starting point to current point
        // updating starting point everytime we move finger
        startingPoint = touchPoint
        
        drawShape()
        
        // NOTE: the path has no color/shape/width

    }
    
    func drawShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(shapeLayer)
        self.setNeedsDisplay()
        
    }
    
    func clearScreen() {
        path.removeAllPoints()
        self.layer.sublayers = nil
        self.setNeedsDisplay()
    }
    
    
    @IBAction func blackStroke(_ sender: Any) {
        
        lineColor = UIColor.black
//        tintColor = lineColor.cgColor
//        self.tintColorDidChange()
//        drawShape()
        
    }
    
    
    
    
        
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
