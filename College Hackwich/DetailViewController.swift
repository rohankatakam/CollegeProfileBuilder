//
//  DetailViewController.swift
//  College Hackwich
//
//  Created by MWen1 on 1/22/16.
//  Copyright © 2016 Matthew Wen. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController,SFSafariViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var collegeTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var populationTextField: UITextField!
    @IBOutlet weak var urlOfSchool: UITextField!
    
    var location = ""
    var college: Colleges!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collegeTextField.text = college.name
        stateTextField.text = college.location
        populationTextField.text = String(college.numberOfStudents)
        imageView.image = college.image
        urlOfSchool.text = college.collegeSite
        
        imagePicker.delegate = self
        //imageView.image = UIImage(named: "")
    }
    //what to do when image selected
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imagePicker.dismissViewControllerAnimated(true) { () -> Void in
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.imageView.image = selectedImage
        }
    }
    
    //Tap the Save Button
    @IBAction func onTappedSaveButton(sender: UIButton) {
        college.name = collegeTextField.text!
        college.location = stateTextField.text!
        college.image = imageView.image
        college.numberOfStudents = Int(populationTextField.text!)!
        college.collegeSite = urlOfSchool.text!
    }
    //Tap open space
    @IBAction func tapOpenSpace(sender: AnyObject) {
        collegeTextField.resignFirstResponder()
        stateTextField.resignFirstResponder()
        populationTextField.resignFirstResponder()
        urlOfSchool.resignFirstResponder()

    }
    //Button that open website
    @IBAction func goToWebSite(sender: AnyObject) {
        let url = NSURL(string: urlOfSchool.text!)
        let svc = SFSafariViewController(URL: url!)
        svc.delegate = self
        self.presentViewController(svc, animated: true, completion: nil)
    }
    //to Camra Button
    @IBAction func onTappedToCamera(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(.Camera){
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    //go to library
    @IBAction func onTappedToLibrary(sender: AnyObject) {
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
       

}

