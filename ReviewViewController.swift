//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by Andrew Hansen on 10/16/14.
//  Copyright (c) 2014 Andrew Hansen. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView:UIImageView!
    @IBOutlet weak var dialogView:UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the background visual effect to Dark Blur
        var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        var blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        // scales down the dialog view for the animation sequence
        let scale = CGAffineTransformMakeScale(0.0, 0.0)
        
        // setup for Slide Up animation, first move the view off the screen
        let translate = CGAffineTransformMakeTranslation(0, 500)
        // concatination of two annimations
        dialogView.transform = CGAffineTransformConcat(scale, translate)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
//        // create the type of animation and set duration
//        UIView.animateWithDuration(0.7, delay: 0.0, options: nil, animations: {
//            self.dialogView.transform = CGAffineTransformMakeScale(1.0, 1.0)
//            }, completion: nil)
        
//        // A different spring animation style
//        UIView.animateWithDuration(0.7, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: nil, animations: {
//            self.dialogView.transform = CGAffineTransformMakeScale(1, 1)
//            }, completion: nil)
        
        // the Slide Up Animation
        UIView.animateWithDuration(0.7, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: nil, animations: {
            let scale = CGAffineTransformMakeScale(1, 1)
            let translate = CGAffineTransformMakeTranslation(0, 0)
            self.dialogView.transform = CGAffineTransformConcat(scale, translate)
            }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
