//
//  ViewController.swift
//  CollegeProfileBuilder
//
//  Created by rkatakam on 1/20/16.
//  Copyright © 2016 Rohan Katakam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    var colleges: [Colleges] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editButton.tag = 0
        
        colleges.append(Colleges(name: "University of Illinois", location: "Champaign, IL", numberOfStudents: 44087, collegeSite: "http://www.http://illinois.edu/", image: UIImage(named: "uofi")!))
        colleges.append(Colleges(name: "UC Berkeley", location: "Berkeley, CA", numberOfStudents: 37581, collegeSite: "http://www.berkeley.edu/", image: UIImage(named: "berkeley")!))
        colleges.append(Colleges(name: "Stanford", location: "Stanford, CA", numberOfStudents: 16136, collegeSite: "http://www.stanford.edu", image: UIImage(named: "Stanford")!))
    
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colleges.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        cell.textLabel?.text = colleges[indexPath.row].name
        cell.detailTextLabel?.text = colleges[indexPath.row].location
        return cell
    
    }

    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let college = colleges[sourceIndexPath.row]
        colleges.removeAtIndex(sourceIndexPath.row)
        colleges.insert(college, atIndex: destinationIndexPath.row)
    }
    

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            colleges.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
        
    }

    @IBAction func onTappedPlusButton(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)
        //textfield
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Add College Here"
        }
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Add Location Here"
        }
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Add Number of Students Here"
            textField.keyboardType = UIKeyboardType.NumberPad
        }
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Add URL of College Here"
            textField.keyboardType = UIKeyboardType.URL
            //textField.text = "http://"
        }
        //cancel Button
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in
            alert.textFields![0].resignFirstResponder()
        }
        alert.addAction(cancelAction)
        //Add Button
        let addAction = UIAlertAction(title: "Add", style: .Default) { (action) -> Void in
            let collegeTextField = alert.textFields![0] as UITextField
            let locationTextField = alert.textFields![1] as UITextField
            let populationTextField = alert.textFields![2] as UITextField
            let siteTextField = alert.textFields![3] as UITextField
            self.colleges.append(Colleges(name: collegeTextField.text!, location: locationTextField.text!, numberOfStudents: Int(populationTextField.text!)!,collegeSite: siteTextField.text!, image: UIImage(named: "School")!))
            self.tableView.reloadData()
           
        }
        
        alert.addAction(addAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    

    @IBAction func onTappedEditButton(sender: UIBarButtonItem) {
        if sender.tag == 0{
            tableView.editing = true
            sender.tag = 1
        }
        else {
            tableView.editing = false
            sender.tag = 0
        }
    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! DetailViewController
        let index = tableView.indexPathForSelectedRow?.row
        dvc.college = colleges[index!]
    }
    
    
}

