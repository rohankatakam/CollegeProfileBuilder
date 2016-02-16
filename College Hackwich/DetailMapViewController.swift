//
//  DetailMapViewController.swift
//  College Hackwich
//
//  Created by MWen1 on 2/12/16.
//  Copyright © 2016 Matthew Wen. All rights reserved.
//

import UIKit
import MapKit

class DetailMapViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var locatonTextField: UITextField!
    
    var college: Colleges!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true)
        locatonTextField.delegate = self
        findLocation(college.location)
        
        
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let locationName = locatonTextField.text!
        textField.resignFirstResponder()
        findLocation(locationName)
        return true
    }
    
    func displayMap(placemark: CLPlacemark){
        locatonTextField.text = placemark.name
        let center = placemark.location!.coordinate
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(center, span)
        let pin = MKPointAnnotation()
        pin.coordinate = center
        pin.title = placemark.name
        mapView.addAnnotation(pin)
        mapView.setRegion(region, animated: true)
    }
    
    func findLocation(locationName: String){
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(locationName) { (placemarks, error) -> Void in
            if error != nil{
                print(error)
            }
            else{
                if placemarks!.count > 1{
                    let alert = UIAlertController(title: "Select a Lcoation", message: nil, preferredStyle: .ActionSheet)
                    for placemark in placemarks!{
                        let locationAction = UIAlertAction(title: placemark.name, style: .Default, handler: { (action) -> Void in
                            self.displayMap(placemark)
                        })
                        alert.addAction(locationAction)
                    }
                    let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
                    alert.addAction(cancelAction)
                    self.presentViewController(alert, animated: true, completion: nil)
                }
                
                else if placemarks!.count == 1{
                    let placemark = placemarks!.first as! CLPlacemark!
                    self.displayMap(placemark)
                }
                
                let placemark = placemarks!.first! as CLPlacemark
                self.displayMap(placemark)
            }
            
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as!  DetailViewController
        dvc.college = self.college
    }
    
    

}
