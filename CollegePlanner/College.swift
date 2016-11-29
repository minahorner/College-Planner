//
//  College.swift
//  CollegePlanner
//
//  Created by student3 on 11/18/16.
//  Copyright © 2016 John Hersey High School. All rights reserved.
//

import UIKit

class College{
    
    init() {
        
    }
    
    init (collegeName: String, studentbodyGender: String, collegeLocation: String, testing: String, decisionDate: String, essaysRequired: String, testPolicy: String, login: String, password: String, difficulty : String, accepted: Bool) {
        self.collegeName = collegeName
        self.studentbodyGender = studentbodyGender
        self.collegeLocation = collegeLocation
        self.testing = testing
        self.decisionDate = decisionDate
        self.essaysRequired = essaysRequired
        self.testPolicy = testPolicy
        self.login = login
        self.password = password
        self.difficulty = difficulty
        self.accepted = accepted
    }
    
    var collegeName: String = ""
    var studentbodyGender : String = ""
    var collegeLocation : String = ""
    var testing: String = ""
    var decisionDate : String = ""
    var essaysRequired: String = ""
    var testPolicy: String = ""
    var login : String = ""
    var password : String = ""
    var difficulty : String = ""
    var accepted : Bool = false

}
