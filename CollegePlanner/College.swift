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
    
    init (collegeName: String, collegeLocation: String, testType: String, decisionDate: String, essaysRequired: String, login: String, password: String, difficulty : String, counselorRecNeeded : String, counselorRecDone : String,
          teacherRecNeeded : String, teacherRecDone : String, essaysDone : String, testSent : String) {
        self.collegeName = collegeName
        self.collegeLocation = collegeLocation
        self.testType = testType
        self.decisionDate = decisionDate
        self.essaysRequired = essaysRequired
        self.login = login
        self.password = password
        self.difficulty = difficulty
        self.counselorRecNeeded = "0"
        self.counselorRecDone = "0"
        self.teacherRecNeeded = "0"
        self.teacherRecDone = "0"
        self.essaysDone = "0"
        self.testSent = "0"
        self.recordID = collegeName
        //checklist = [testSent, essaysDone, counselorRecDone, teacherRecDone, accepted]
        
    }
    
    var collegeName: String = ""
    var studentbodyGender : String = ""
    var collegeLocation : String = ""
    var testType: String = ""
    var decisionDate : String = ""
    var essaysRequired: String = ""
    var counselorRecNeeded: String = ""
    var teacherRecNeeded: String = ""
    var login : String = ""
    var password : String = ""
    var difficulty : String = ""
    var recordID : String = ""
    var teacherRecDone: String = ""
    var counselorRecDone: String =  ""
    var essaysDone: String = ""
    var testSent: String = ""
    var accepted : String = ""
    
    //var checklist: [Bool] = [testSent]
    
}
