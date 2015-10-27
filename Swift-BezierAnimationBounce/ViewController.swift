//
//  ViewController.swift
//  Swift-BezierAnimationBounce
//
//  Created by caiwenshu on 10/14/15.
//  Copyright (c) 2015 caiwenshu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var bgView:UIView?
    var bounceView:WSBezierAnimationBounceView?
    
    let EXTRAAREA:CGFloat = 30.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bgView = UIView(frame: self.view.bounds)
        self.bgView!.backgroundColor = UIColor.blackColor()
        
        self.bounceView = WSBezierAnimationBounceView(frame: CGRectMake(0, 0, self.view.bounds.width/2.0  + EXTRAAREA, self.view.bounds.height))
        self.bounceView!.backgroundColor = UIColor.blueColor()
    
        self.view.addSubview(self.bounceView!)
        
        // Do any additional setup after loading the view, typically from a nib.
        
//        self.view .addSubview(self.bgView)
//        self.view.addSubview(self.bounceView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        self.bounceView! .showBounce()
    }

}

