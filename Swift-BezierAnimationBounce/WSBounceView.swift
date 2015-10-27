//
//  WSBounceView.swift
//  
//
//  Created by caiwenshu on 10/27/15.
//
//

import UIKit

class WSBounceView: UIView {

    var slideToCenterDelta:CGFloat = 0.0
    let fillColor = UIColor(red: 0, green: 0.722, blue: 1, alpha: 1)

    let EXTRAAREA:CGFloat = 50.0
    
    var assistCenterView:UIView = UIView(frame: CGRectZero)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        assistCenterView.backgroundColor = UIColor.blackColor()

        self .addSubview(assistCenterView)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
    
        let yOffset:CGFloat = 20.0
        let width = CGRectGetWidth(self.bounds)
        let height = CGRectGetHeight(self.bounds)
        
        let path = UIBezierPath()
        
        assistCenterView.frame = CGRectMake(self.frame.width - EXTRAAREA - 15 + slideToCenterDelta, (height - 30.0) / 2.0 , 30.0, 30)
        
        path.moveToPoint(CGPoint(x: 0.0, y: 0.0))
        path.addLineToPoint(CGPoint(x: self.frame.width - EXTRAAREA, y: 0))
        path.addQuadCurveToPoint(CGPoint(x: self.frame.width - EXTRAAREA, y: self.frame.height),
            controlPoint: CGPoint(x: self.frame.width - EXTRAAREA + slideToCenterDelta, y: height / 2.0))
        
        path.addLineToPoint(CGPoint(x: width, y: height))
        path.addLineToPoint(CGPoint(x: 0.0, y: height))
        path.closePath()
        
        let context = UIGraphicsGetCurrentContext()
        CGContextAddPath(context, path.CGPath)
        fillColor.set()
        CGContextFillPath(context)
    }
    
}
