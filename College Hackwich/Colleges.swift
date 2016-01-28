//
//  Colleges.swift
//  College Hackwich
//
//  Created by MWen1 on 1/21/16.
//  Copyright © 2016 Matthew Wen. All rights reserved.
//

import UIKit

class Colleges: NSObject {
    var name = ""
    var location = ""
    var numberOfStudents = 0
    var image = UIImage(named: "Default")
    
    convenience init(name: String, location: String, numberOfStudents: Int, image: UIImage){
        self.init()
        self.name = name
        self.location = location
        self.numberOfStudents = numberOfStudents
        self.image = image
       
        
    }
    
    convenience init(name: String, location: String, numberOfStudents: Int){
        self.init()
        self.name = name
        self.location = location
        self.numberOfStudents = numberOfStudents
        
    }
}


