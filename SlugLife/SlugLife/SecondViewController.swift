//
//  SecondViewController.swift
//  SlugLife
//
//  Created by Tim on 10/5/15.
//  Copyright © 2015 Tim Mertogul. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //http://www.raywenderlich.com/76020/using-uigesturerecognizer-with-swift-tutorial
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translationInView(self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                y:view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPointZero, inView: self.view)
    }
    
    @IBAction func handlePinch(recognizer : UIPinchGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = CGAffineTransformScale(view.transform,
                recognizer.scale, recognizer.scale)
            recognizer.scale = 1
        }
    }
}

