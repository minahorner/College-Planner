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
       // self.checklist = [false, false, false, false, false]
    }
    
    init (collegeName: String, studentbodyGender: String, collegeLocation: String, testType: String, decisionDate: String, essaysRequired: String, testPolicy: String, login: String, password: String, difficulty : String) {
        self.collegeName = collegeName
        self.studentbodyGender = studentbodyGender
        self.collegeLocation = collegeLocation
        self.testType = testType
        self.decisionDate = decisionDate
        self.essaysRequired = essaysRequired
        self.testPolicy = testPolicy
        self.login = login
        self.password = password
        self.difficulty = difficulty
        //checklist = [testSent, essaysDone, counselorRecDone, teacherRecDone, accepted]
        
    }
    
    var collegeName: String = ""
    var studentbodyGender : String = ""
    var collegeLocation : String = ""
    var testType: String = ""
    var decisionDate : String = ""
    var essaysRequired: String = ""
    var testPolicy: String = ""
    var counselorRecNeeded: Bool = false
    var teacherRecNeeded: Bool = false
    var login : String = ""
    var password : String = ""
    var difficulty : String = ""
    
    var teacherRecDone: Bool = false
    var counselorRecDone: Bool =  false
    var essaysDone: Bool = false
    var testSent: Bool = false
    var accepted : Bool = false
    
    //var checklist: [Bool] = [testSent]

}
