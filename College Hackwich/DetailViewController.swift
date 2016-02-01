//
//  DetailViewController.swift
//  College Hackwich
//
//  Created by MWen1 on 1/22/16.
//  Copyright © 2016 Matthew Wen. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController,SFSafariViewControllerDelegate {
    
    @IBOutlet weak var collegeTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var populationTextField: UITextField!
    @IBOutlet weak var urlOfSchool: UITextField!
    
    var location = ""
    var college: Colleges!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collegeTextField.text = college.name
        stateTextField.text = college.location
        populationTextField.text = String(college.numberOfStudents)
        imageView.image = college.image
        urlOfSchool.text = college.collegeSite
        
        
    }
    //Tap the Save Button
    @IBAction func onTappedSaveButton(sender: UIButton) {
        college.name = collegeTextField.text!
        college.location = stateTextField.text!
        college.image = imageView.image
        college.numberOfStudents = Int(populationTextField.text!)!
        college.collegeSite = urlOfSchool.text!
    }
    
    @IBAction func tapOpenSpace(sender: AnyObject) {
        collegeTextField.resignFirstResponder()
        stateTextField.resignFirstResponder()
        populationTextField.resignFirstResponder()
        urlOfSchool.resignFirstResponder()

    }

    @IBAction func goToWebSite(sender: AnyObject) {
        let url = NSURL(string: urlOfSchool.text!)
        let svc = SFSafariViewController(URL: url!)
        svc.delegate = self
        self.presentViewController(svc, animated: true, completion: nil)
    }
    

}
