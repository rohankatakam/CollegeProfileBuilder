//
//  ViewController.swift
//  College Hackwich
//
//  Created by MWen1 on 1/20/16.
//  Copyright © 2016 Matthew Wen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    var colleges: [Colleges] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editButton.tag = 0
        
        colleges.append(Colleges(name: "University of Chicago", location: "Chicago,IL", numberOfStudents: 14770, image: UIImage(named: "UniverstyOfChicago")!))
        colleges.append(Colleges(name: "Northwestern", location: "Chicago,IL", numberOfStudents: 20336, image: UIImage(named: "NorthWestern")!))
        colleges.append(Colleges(name: "Standford", location: "San Francisco,CA", numberOfStudents: 16136, image: UIImage(named: "StanFord")!))
    
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    //count # of table views to have
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colleges.count
    }
    //cell display city
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        cell.textLabel?.text = colleges[indexPath.row].name
        cell.detailTextLabel?.text = colleges[indexPath.row].location
        return cell
    
    }
    //allow table view to be editied
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    //allows the table view to be moved around 
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let college = colleges[sourceIndexPath.row]
        colleges.removeAtIndex(sourceIndexPath.row)
        colleges.insert(college, atIndex: destinationIndexPath.row)
    }
    
    //Delete a cell
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            colleges.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
        
    }
    //Tap the plus button
    @IBAction func onTappedPlusButton(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)
        //textfield
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Add College Here"
        }
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Add State Here"
        }
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Add Population Here"
            textField.keyboardType = UIKeyboardType.NumberPad
        }
        //cancel Button
        //let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in
            alert.textFields![0].resignFirstResponder()
        }
        alert.addAction(cancelAction)
        //Add Button
        let addAction = UIAlertAction(title: "Add", style: .Default) { (action) -> Void in
            let collegeTextField = alert.textFields![0] as UITextField
            let stateTextField = alert.textFields![1] as UITextField
            let populationTextField = alert.textFields![2] as UITextField
            self.colleges.append(Colleges(name: collegeTextField.text!, location: stateTextField.text!, numberOfStudents: Int(populationTextField.text!)!))
            self.tableView.reloadData()
           
        }
        
        alert.addAction(addAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    //Tap the Edit Button
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

