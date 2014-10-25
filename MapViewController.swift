//
//  MapViewController.swift
//  FoodPin
//
//  Created by Andrew Hansen on 10/17/14.
//  Copyright (c) 2014 Andrew Hansen. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var mapView:MKMapView!
    
    var restaurant:Restaurant!

 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self

        // Convert address to Lat/Long coordinate and annotate it on map
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(restaurant.location, completionHandler: { placemarks, error in  // not sure i understand the way this function call and closure work. why doesn't placemarks need to be in [ ]
            
            if error != nil {
                println(error)
                return
            }
            
            if placemarks != nil && placemarks.count > 0 {
                let placemark = placemarks[0] as CLPlacemark
                
                // Add Annotation
                let annotation = MKPointAnnotation()
                annotation.title = self.restaurant.name
                annotation.subtitle = self.restaurant.type
                annotation.coordinate = placemark.location.coordinate
                
                self.mapView.showAnnotations([annotation], animated: true)
                self.mapView.selectAnnotation(annotation, animated: true)
            }
            
        })
        
    }
  
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        let identifier = "MyPin"
        
        
        // checks to see if annotation is a MKUserLocation (ie. blue dot current location). Even though this feature has not been implemented in the app, we don't want to change its annotation view.
        if annotation.isKindOfClass(MKUserLocation) {
            return nil
        }
        
        // reuse the annotation if possible
        var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) // trying to understand how the idenifier works
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView.canShowCallout = true
        }
        
        let leftIconView = UIImageView(frame: CGRectMake(0, 0, 47, 47))
        leftIconView.image = UIImage(named: restaurant.image)
        annotationView.leftCalloutAccessoryView = leftIconView
        
        return annotationView
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
