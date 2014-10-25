//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Andrew Hansen on 10/10/14.
//  Copyright (c) 2014 Andrew Hansen. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    
    

    
    var restaurants:[Restaurant] = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong", image: "cafedeadend.jpg", isVisited: true),
        Restaurant(name: "Homei", type: "Cafe", location: "Shop B, G/F, 22-24A Tai Ping San Street SOHO, Sheung Wan, Hong Kong", image: "homei.jpg", isVisited: false),
        Restaurant(name: "Teakha", type: "Tea House", location: "Shop B, 18 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", image: "teakha.jpg", isVisited: false),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Shop B, 20 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", image: "cafeloisl.jpg", isVisited: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "24 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", image: "petiteoyster.jpg", isVisited: false),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Shop J-K., 200 Hollywood Road, SOHO, Sheung Wan, Hong Kong", image: "forkeerestaurant.jpg", isVisited: false),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "G/F, 62 Po Hing Fong, Sheung Wan, Hong Kong", image: "posatelier.jpg", isVisited: false),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "633 Bourke St Sydney New South Wales 2010 Surry Hills", image: "bourkestreetbakery.jpg", isVisited: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "412-414 George St Sydney New South Wales", image: "haighschocolate.jpg", isVisited: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Shop 1 61 York St Sydney New South Wales", image: "palominoespresso.jpg", isVisited: false),
        Restaurant(name: "Upstate", type: "American", location: "95 1st Ave New York, NY 10003", image: "upstate.jpg", isVisited: false),
        Restaurant(name: "Traif", type: "American", location: "229 S 4th St Brooklyn, NY 11211", image: "traif.jpg", isVisited: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "445 Graham Ave Brooklyn, NY 11211", image: "grahamavenuemeats.jpg", isVisited: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "413 Graham Ave Brooklyn, NY 11211", image: "wafflewolf.jpg", isVisited: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "18 Bedford Ave Brooklyn, NY 11222", image: "fiveleaves.jpg", isVisited: false),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "Sunset Park 4601 4th Ave Brooklyn, NY 11220", image: "cafelore.jpg", isVisited: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "308 E 6th St New York, NY 10003", image: "confessional.jpg", isVisited: false),
        Restaurant(name: "Barrafina", type: "Spanish", location: "54 Frith Street London W1D 4SL United Kingdom", image: "barrafina.jpg", isVisited: false),
        Restaurant(name: "Donostia", type: "Spanish", location: "10 Seymour Place London W1H 7ND United Kingdom", image: "donostia.jpg", isVisited: false),
        Restaurant(name: "Royal Oak", type: "British", location: "2 Regency Street London SW1P 4BZ United Kingdom", image: "royaloak.jpg", isVisited: false),
        Restaurant(name: "Thai Cafe", type: "Thai", location: "22 Charlwood Street London SW1V 2DY Pimlico", image: "thaicafe.jpg", isVisited: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        // Empty the back button title
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
            
        // sets the self sizing cell for location
        tableView.estimatedRowHeight = 18
        tableView.rowHeight = UITableViewAutomaticDimension
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Return the number of rows in the section.
        return self.restaurants.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as CustomTableViewCell
        
        // configures the cell...
        let restaurant = restaurants[indexPath.row]
        cell.nameLabel.text = restaurant.name
        cell.thumbnailImageView.image = UIImage(named: restaurant.image)
        cell.locationLabel.text = restaurant.location
        cell.typeLabel.text = restaurant.type
        cell.favorIconImageView.hidden = !restaurant.isVisited
        
        // circular image
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.width / 2
        cell.thumbnailImageView.clipsToBounds = true
        
        
        
        return cell
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    
    
    
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        
//        // create an option menu as an action sheet
//        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .ActionSheet)
//        
//        // add cancel action to the menu
//        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
//        optionMenu.addAction(cancelAction)
//        
//        // add call action to menu
//        let callActionHandler = { (action:UIAlertAction!) -> Void in
//            
//            let alertMessege = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .Alert)
//            alertMessege.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
//            self.presentViewController(alertMessege, animated: true, completion: nil)
//        }
//        
//        let callAction = UIAlertAction(title: "Call " + "919-676-321\(indexPath.row)", style: .Default, handler: callActionHandler)
//        optionMenu.addAction(callAction)
//        
//        // add I've been here action to the menu
//        let isVisitedTitle = restaurantIsVisited[indexPath.row] ? "I haven't been here before" : "I've been here"
//        let isVisitedAction = UIAlertAction(title: isVisitedTitle, style: .Default, handler: {
//            (action: UIAlertAction!) -> Void in
//            
//            let cell = tableView.cellForRowAtIndexPath(indexPath) as CustomTableViewCell
//            
//            // Toggle checkmark
//            self.restaurantIsVisited[indexPath.row] = self.restaurantIsVisited[indexPath.row] ? false : true
//            
//            // here is a shorthand way to write an IF CONDITION using the TERNARY conditional operator (?:):
//        //    cell.accessoryType = restaurantIsVisited[indexPath.row] ? .Checkmark : .None
//            cell.favorIconImageView.hidden = !self.restaurantIsVisited[indexPath.row]
//            
//            })
//        
//        optionMenu.addAction(isVisitedAction)
//        
//        // display the menu
//        self.presentViewController(optionMenu, animated: true, completion: nil)
//        
//        // deselect the cell
//        tableView.deselectRowAtIndexPath(indexPath, animated: false)
//        
//    }
    
        // function to implement edit of cell feature and provide deletion method of row, which no longer is called since editActionForRowAtIndexPath was inserted below
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            self.restaurants.removeAtIndex(indexPath.row)
    
            
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
        
        var shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Normal, title: "Share", handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            let shareMenu = UIAlertController(title: nil, message: "Share using", preferredStyle: .ActionSheet)
            let twitterAction = UIAlertAction(title: "Twitter", style: .Default, handler: nil)
            let facebookAction = UIAlertAction(title: "Facebook", style: UIAlertActionStyle.Default, handler: nil)
            let emailAction = UIAlertAction(title: "Email", style: .Default, handler: nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            
            shareMenu.addAction(twitterAction)
            shareMenu.addAction(facebookAction)
            shareMenu.addAction(emailAction)
            shareMenu.addAction(cancelAction)
            
            self.presentViewController(shareMenu, animated: true, completion: nil)
            }
        )
        
        var deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete", handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            
            self.restaurants.removeAtIndex(indexPath.row)
        
            self.tableView.deleteRowsAtIndexPaths( [indexPath], withRowAnimation: .Fade)
            }
        )
        // adding custom color to the edit buttons
        shareAction.backgroundColor = UIColor(red: 129/255, green: 171/255, blue: 112/288, alpha: 1)
        deleteAction.backgroundColor = UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1)
        
        return [shareAction, deleteAction]
    }
    
    
    // here is the segue to the next scene, passing data to the new view controller
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showRestaurantDetail" {
            // the if let here is used because the indexPath object is an Optional, the conditional block only will be executed if an indexPath exists
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let destinationController = segue.destinationViewController as DetailViewController
                destinationController.restaurant = restaurants[indexPath.row]
            }
        }
    }
    
    
    // set the navigation bar to hide when swiped
    override func viewWillAppear(animated: Bool) {
            super.viewWillAppear(animated)
            
            self.navigationController?.hidesBarsOnSwipe = true
    }

    @IBAction func unwindToHomeScreen(segue:UIStoryboardSegue) {
        
    }
  
}
