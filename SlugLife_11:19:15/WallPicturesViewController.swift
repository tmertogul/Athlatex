//
//  WallPicturesViewController.swift
//  ParseTutorial
//
//  Created by Ron Kliffer on 3/6/15.
//  Copyright (c) 2015 Ron Kliffer. All rights reserved.
//

import UIKit

class WallPicturesViewController: UIViewController {

    @IBOutlet weak var wallScroll: UIScrollView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //Clean the scroll view
        cleanWall()
        
        //Reload the wall
        getWallImages()
    }
    
    // MARK: - Wall
    func cleanWall()
    {
        for viewToRemove in wallScroll.subviews {
            if let viewToRemove = viewToRemove as? UIView {
                viewToRemove.removeFromSuperview()
            }
        }
    }
    
    func getWallImages() {
        //TODO: Get the wall objects from the server
        //TODO: Put the wall objects in the scroll view
    }
    
    // MARK: - Actions
    @IBAction func logOutPressed(sender: AnyObject) {
        //TODO
        //If logout succesful:
        navigationController?.popToRootViewControllerAnimated(true)
    }
}