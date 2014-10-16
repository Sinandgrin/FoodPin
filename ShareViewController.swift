//
//  ShareViewController.swift
//  FoodPin
//
//  Created by Andrew Hansen on 10/16/14.
//  Copyright (c) 2014 Andrew Hansen. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView:UIImageView!
    @IBOutlet weak var facebookButtonView:UIButton!
    @IBOutlet weak var twitterButtonView:UIButton!
    @IBOutlet weak var messegeButtonView:UIButton!
    @IBOutlet weak var emailButtonView:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        var blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        emailButtonView.hidden = true
        twitterButtonView.hidden = true
        
        facebookButtonView.transform = CGAffineTransformMakeTranslation(0, 500)
        messegeButtonView.transform = CGAffineTransformMakeTranslation(0, 500)
        emailButtonView.transform = CGAffineTransformMakeTranslation(0, -500)
        twitterButtonView.transform = CGAffineTransformMakeTranslation(0, -500)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        UIButton.animateWithDuration(0.7, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: nil, animations: {
            self.facebookButtonView.transform = CGAffineTransformMakeTranslation(0, 0)
            }, completion: nil)
        UIButton.animateWithDuration(0.7, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: nil, animations: {
            self.messegeButtonView.transform = CGAffineTransformMakeTranslation(0, 0)
            }, completion: nil)
        emailButtonView.hidden = false
        twitterButtonView.hidden = false
        UIButton.animateWithDuration(0.7, delay: 0.4, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: nil, animations: {
            self.emailButtonView.transform = CGAffineTransformMakeTranslation(0, 0)
            }, completion: nil)
        UIButton.animateWithDuration(0.7, delay: 0.6, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: nil, animations: {
            self.twitterButtonView.transform = CGAffineTransformMakeTranslation(0, 0)
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
