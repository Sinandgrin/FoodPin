//
//  DetailViewController.swift
//  FoodPin
//
//  Created by Andrew Hansen on 10/15/14.
//  Copyright (c) 2014 Andrew Hansen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var restaurantImageView:UIImageView!
    @IBOutlet var tableView:UITableView!
    
    @IBAction func close(segue:UIStoryboardSegue) {
        
    }

    
    var restaurantImage:String!
    
    
    var restaurant:Restaurant!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.restaurantImageView.image = UIImage(named: restaurant.image)
        // sets tableView appearence
        self.tableView.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 0.2)
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
        self.tableView.separatorColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 0.8)
        // sets the Title for the view based on the restaurant selection
        title = self.restaurant.name
        
        // sets the Self Sizing Cell behavior
        tableView.estimatedRowHeight = 36
        tableView.rowHeight = UITableViewAutomaticDimension

    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as DetailTableViewCell
        
        // configure the cell
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "Name"
            cell.valueLabel.text = restaurant.name
        case 1:
            cell.fieldLabel.text = "Type"
            cell.valueLabel.text = restaurant.type
        case 2:
            cell.fieldLabel.text = "Location"
            cell.valueLabel.text = restaurant.location
        case 3:
            cell.fieldLabel.text = "Been Here"
            cell.valueLabel.text = restaurant.isVisited ? "Yes, I've been here before" : "No"
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        cell.backgroundColor = UIColor.clearColor() // makes the tableview cells transparent so you can see the background color of the tableview
        
        return cell
    }
    
    
    // ensures that the navigation bar hiding when swipped does not happen
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.hidesBarsOnSwipe = false
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
