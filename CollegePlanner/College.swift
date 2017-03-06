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
          teacherRecNeeded : String, teacherRecDone : String, essaysDone : String, testSent : String, accepted : String) {
        self.collegeName = collegeName
        self.collegeLocation = collegeLocation
        self.testType = testType
        self.decisionDate = decisionDate
        self.essaysRequired = essaysRequired
        self.login = login
        self.password = password
        self.difficulty = difficulty
        self.counselorRecNeeded = insertBool(property: counselorRecNeeded)
        self.counselorRecDone = insertBool(property: counselorRecDone)
        self.teacherRecNeeded = insertBool(property: teacherRecNeeded)
        self.teacherRecDone = insertBool(property: teacherRecDone)
        self.essaysDone = insertBool(property: essaysDone)
        self.testSent = insertBool(property: testSent)
        self.accepted = insertBool(property: accepted)
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
    
    func insertBool(property : String) -> Bool{
        if(property == "1"){
            return true
        }
        else{
            return false
        }
    }
}
