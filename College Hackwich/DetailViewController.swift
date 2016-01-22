//
//  DetailViewController.swift
//  College Hackwich
//
//  Created by MWen1 on 1/22/16.
//  Copyright © 2016 Matthew Wen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var collegeTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var college: Colleges!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collegeTextField.text = college.name
        stateTextField.text = college.state
        imageView.image = college.image
        
    }
    //Tap the Save Button
    @IBAction func onTappedSaveButton(sender: UIButton) {
        college.name = collegeTextField.text!
        college.state = stateTextField.text!
        college.image = imageView.image
    }

    

}
