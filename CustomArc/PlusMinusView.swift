//
//  PlusMinusView.swift
//  CaloriesMeasureInterface
//
//  Created by Tigran on 15.10.2017.
//  Copyright © 2017 Tigran. All rights reserved.
//

import UIKit

@IBDesignable
class PlusMinusView: UIView {

    //Constants
    private struct Constants {
        static let plusLineWidth: CGFloat = 3.0
        static let plusButtonScale: CGFloat = 0.6
        static let halfPointShift: CGFloat = 0.5
    }

    //Properties
    private var halfWidth: CGFloat {
        return bounds.width / 2
    }
    
    private var halfHight: CGFloat {
        return bounds.height / 2
    }
    
    //Outlets
    @IBInspectable var fillColor: UIColor = .green
    @IBInspectable var isRightView: Bool = true
    
    
    //MARK: - Drawing the view 
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        fillColor.setFill()
        path.fill()
        
        //Set up width and height parameters for the
        //Horizontal stroke
        let plusWidth = min(bounds.width, bounds.height) * Constants.plusButtonScale
        let halfPlusWidth = plusWidth / 2
        
        //Create the path
        let plusPath = UIBezierPath()
        
        //Set the path's line width to the width of the stroke
        plusPath.lineWidth = Constants.plusLineWidth
        
        //Move the intial point of the path to the
        //Start of the horizontal stroke (give the line the
        //start position)
        plusPath.move(to: CGPoint(x: halfWidth - halfPlusWidth + Constants.halfPointShift, y: halfHight))
        
        //Add a point to the path at the end of the stroke
        //(Give the line the final position)
        plusPath.addLine(to: CGPoint(x: halfWidth + halfPlusWidth + Constants.halfPointShift, y: halfHight))
        
        if isRightView {
            //Drawing a vertical line
            plusPath.move(to: CGPoint(x: halfWidth, y: halfHight - halfPlusWidth + Constants.halfPointShift))
            
            plusPath.addLine(to: CGPoint(x: halfWidth, y: halfHight  + halfPlusWidth + Constants.halfPointShift))
        }
        
        //Set the stroke color
        UIColor.white.setStroke()
        
        //Draw the stroke
        plusPath.stroke()
        
    }
}
