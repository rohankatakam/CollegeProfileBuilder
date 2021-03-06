//
//  Colleges.swift
//  CollegeProfileBuilder
//
//  Created by rkatakam on 1/20/16.
//  Copyright © 2016 Rohan Katakam. All rights reserved.
//

import UIKit

class Colleges: NSObject {
    var name = ""
    var location = ""
    var numberOfStudents = 0
    var image = UIImage(named: "Default")
    var collegeSite = ""
    
    convenience init(name: String, location: String, numberOfStudents: Int, collegeSite: String, image: UIImage){
        self.init()
        self.name = name
        self.location = location
        self.numberOfStudents = numberOfStudents
        self.image = image
        self.collegeSite = collegeSite
    }
    
    convenience init(name: String, location: String, numberOfStudents: Int, collegeSite: String){
        self.init()
        self.name = name
        self.location = location
        self.numberOfStudents = numberOfStudents
        self.collegeSite = collegeSite
    }
}


