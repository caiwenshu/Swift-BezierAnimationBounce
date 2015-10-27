//
//  WSBezierAnimationBounceView.swift
//  
//
//  Created by caiwenshu on 10/14/15.
//
//

import UIKit

class WSBezierAnimationBounceView: UIView {

    let EXTRAAREA:CGFloat = 50.0
    

    var bounceView:WSBounceView = WSBounceView(frame: CGRectZero)
    
    
    var assistBlueView:UIView = UIView(frame: CGRectZero)
    var assistRedView:UIView = UIView(frame: CGRectZero)
    
    
    var displayLink: CADisplayLink?
    var animationCount = 0
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.bounceView.frame = CGRectMake(0, 0.0 , self.bounds.width, frame.height)
        self.bounceView.backgroundColor = UIColor.brownColor()
        
        self.assistBlueView.frame = CGRectMake(0.0, 0.0, 50.0, 50.0)
        self.assistBlueView.backgroundColor = UIColor.yellowColor()
        
        self.assistRedView.frame = CGRectMake(0.0, (frame.height - 50.0) / 2.0, 50.0, 50.0)
        self.assistRedView.backgroundColor = UIColor.redColor()
        
        self.addSubview(self.bounceView)
        self.addSubview(self.assistBlueView)
        self.addSubview(self.assistRedView)
        
    }

    required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
    
    func showBounce()
    {
        self.assistBlueView.frame = CGRectMake(0.0, 0.0, 50.0, 50.0)
        self.assistRedView.frame = CGRectMake(0.0, (self.bounds.height - 50.0) / 2.0, 50.0, 50.0)
        
        self.startAnimation()
        
        //show
        UIView .animateWithDuration(0.7,
            delay: 0.0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0.9,
            options:UIViewAnimationOptions.BeginFromCurrentState | UIViewAnimationOptions.AllowUserInteraction ,
            animations: { () -> Void in
            
                self.assistBlueView.frame = CGRectMake(self.bounds.width - self.EXTRAAREA, 0.0, 50.0, 50.0)
                
                
        }) { (complete) -> Void in
            
            self.endAnimation()
        }
        
        
        self.startAnimation()
        
        UIView.animateWithDuration(0.7,
            delay: 0.0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 2.0,
            options: UIViewAnimationOptions.BeginFromCurrentState | UIViewAnimationOptions.AllowUserInteraction,
            animations: { () -> Void in
            
                self.assistRedView.frame = CGRectMake(self.bounds.width - self.EXTRAAREA, (self.bounds.height - 50.0) / 2.0, 50.0, 50.0)
                
        }) { (complete) -> Void in
            
            self.endAnimation()
        }
        
        
    }
    
    
    
    
    func startAnimation()
    {
        if (self.displayLink == nil)
        {
            self.displayLink = CADisplayLink(target: self, selector: "tick:")
            self.displayLink?.addToRunLoop(NSRunLoop .mainRunLoop(), forMode: NSDefaultRunLoopMode)
        }
        
        animationCount++
    }
    
    func endAnimation()
    {
        animationCount--
        if (animationCount == 0) {
            displayLink?.invalidate()
            displayLink = nil
        }
    }
    
    
    func tick(displayLink:CADisplayLink)
    {
        let bluePresentationLayout = assistBlueView.layer.presentationLayer() as! CALayer
        let redPresentationLayout = assistRedView.layer.presentationLayer() as! CALayer
        
//        bluePresentationLayout.frame
        
        bounceView.slideToCenterDelta = bluePresentationLayout.frame.origin.x - redPresentationLayout.frame.origin.x
        
        bounceView .setNeedsDisplay()
    }
    
    
}
