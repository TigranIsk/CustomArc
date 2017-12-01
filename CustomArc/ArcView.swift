//
//  ArcView.swift
//  CaloriesMeasureInterface
//
//  Created by Tigran on 15.10.2017.
//  Copyright © 2017 Tigran. All rights reserved.
//

import UIKit

import UIKit

@IBDesignable class ArcView: UIView {
    
    private struct Constants {
        static let maxNumberOfItems = 2589
        static let lineWidth: CGFloat = 5.0
        static let arcWidth: CGFloat = 76
        
        static var halfOfLineWidth: CGFloat {
            return lineWidth / 2
        }
    }
    
    @IBInspectable var counter: Int = 1234 {
        didSet {
            if counter <=  Constants.maxNumberOfItems {
                //the view needs to be refreshed
                setNeedsDisplay()
            }
        }
    }
    @IBInspectable var outlineColor: UIColor = UIColor.blue
    @IBInspectable var counterColor: UIColor = UIColor.orange
    @IBInspectable var outlineFillingColor: UIColor = UIColor.red
    
    
    //MARK: - Drawing the arc
    override func draw(_ rect: CGRect) {
        // The center point
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        
        // The radius
        let radius: CGFloat = max(bounds.width, bounds.height)
        
        // Starting and ending angles (where the arc starts and ends)
        let startAngle: CGFloat = 3 * .pi / 4
        let endAngle: CGFloat = .pi / 4
        
        // Creating the path via the configs defined above
        let path = UIBezierPath(arcCenter: center,
                                radius: radius/2 - Constants.arcWidth/2,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        
        // Stroking the path
        path.lineWidth = Constants.arcWidth
        counterColor.setStroke()
        path.stroke()
        
        
        //Drawing the outline
        
        //Calculating the difference between the two angles
        //ensuring it is positive
        let angleDifference: CGFloat = 2 * .pi - startAngle + endAngle
        //Calculating the arc for each item
        let arcLengthPerGlass = angleDifference / CGFloat(Constants.maxNumberOfItems)
        //Multiplying out by the actual number of items
        let outlineEndAngle = arcLengthPerGlass * CGFloat(counter) + startAngle
        
        //Drawing the outer arc (on the outer side of the existing arc)
        let outlinePath = UIBezierPath(arcCenter: center,
                                       radius: bounds.width/2 - Constants.halfOfLineWidth,
                                       startAngle: startAngle,
                                       endAngle: outlineEndAngle,
                                       clockwise: true)
        
        //Drawing the inner arc (on the inner side of the existing arc)
        outlinePath.addArc(withCenter: center,
                           radius: bounds.width/2 - Constants.arcWidth + Constants.halfOfLineWidth,
                           startAngle: outlineEndAngle,
                           endAngle: startAngle,
                           clockwise: false)
        
        //Closing the path, so two arcs become connected
        outlinePath.close()
        
        
        //Setting Colors
        outlineColor.setStroke()
        outlinePath.lineWidth = Constants.lineWidth
        outlinePath.stroke()
        outlineFillingColor.setFill()
        outlinePath.fill()
    }
}


