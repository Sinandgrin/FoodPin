//
//  AddTableViewController.swift
//  FoodPin
//
//  Created by Andrew Hansen on 10/23/14.
//  Copyright (c) 2014 Andrew Hansen. All rights reserved.
//

import UIKit

class AddTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView:UIImageView!
    @IBOutlet weak var nameTextField:UITextField!
    @IBOutlet weak var typeTextField:UITextField!
    @IBOutlet weak var locationTextField:UITextField!
    @IBOutlet weak var yesButton:UIButton!
    @IBOutlet weak var noButton:UIButton!
    
    var isVisited = false
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .PhotoLibrary
                
                imagePicker.delegate = self
                
                self.presentViewController(imagePicker, animated: true, completion: nil)
            }
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        
    }
    
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        imageView.image = image
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.clipsToBounds = true
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func navigationController(navigationController: UINavigationController!, willShowViewController viewController: UIViewController!, animated: Bool) {
        UIApplication.sharedApplication().setStatusBarStyle(.LightContent, animated: false)
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
    }
    
    @IBAction func saveNewRestaurant() {
        
        // entry form validation
        var error = ""
        
        if nameTextField.text == "" {
            error = "name"
        } else if typeTextField.text == "" {
            error = "type"
        } else if locationTextField.text == "" {
            error = "location"
        }
        
        if error != "" {
            
            let alertMessege = UIAlertController(title: "Oops", message: "It looks like you might have forgotten to fill in the restaurant " + error + ". Please make sure all fields are correct.", preferredStyle: .Alert)
            let doneAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertMessege.addAction(doneAction)
            
            self.presentViewController(alertMessege, animated: true, completion: nil)
            
            return
        }
        
        // if all fields are filled, extract the value
        println("Name: " + nameTextField.text)
        println("Type: " + typeTextField.text)
        println("Location: " + locationTextField.text)
        println("Have you been here: " + (isVisited ? "Yes" : "No"))
        
        performSegueWithIdentifier("unwindToHomeScreen", sender: self)
        
    }
    
    @IBAction func updateIsVisited (sender : AnyObject) {
        let buttonClicked = sender as UIButton
        if buttonClicked == yesButton {
            isVisited = true
            yesButton.backgroundColor = UIColor(red: 235/255, green: 73/255, blue: 27/255, alpha: 1.0)
            noButton.backgroundColor = UIColor.grayColor()
        } else if buttonClicked == noButton {
            isVisited = false
            yesButton.backgroundColor = UIColor.grayColor()
            noButton.backgroundColor = UIColor(red: 235/255, green: 73/255, blue: 27/255, alpha: 1.0)
        }
    }



}
