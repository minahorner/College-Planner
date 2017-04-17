//
//  College.swift
//  CollegePlanner
//
//  Created by student3 on 11/18/16.
//  Copyright © 2016 John Hersey High School. All rights reserved.
//

import UIKit
import CloudKit

class College{
    
    init() {

    }
    
    init (collegeName: String, collegeLocation: String, testType: String, decisionDate: String, essaysRequired: String, login: String, password: String, difficulty : String, counselorRecNeeded : String, counselorRecDone : String,
          teacherRecNeeded : String, teacherRecDone : String, essaysDone : String, testSent : String, collegeType : String, allCollegeOrder : Int64, thinkingAboutCollegeOrder : Int64, appliedToCollegeOrder : Int64, acceptedCollegeOrder : Int64, recordID : CKRecordID) {
        self.collegeName = collegeName
        self.collegeLocation = collegeLocation
        self.testType = testType
        self.decisionDate = decisionDate
        self.essaysRequired = essaysRequired
        self.login = login
        self.password = password
        self.difficulty = difficulty
        self.counselorRecNeeded = counselorRecNeeded
        self.counselorRecDone = counselorRecDone
        self.teacherRecNeeded = teacherRecNeeded
        self.teacherRecDone = teacherRecDone
        self.essaysDone = essaysDone
        self.testSent = testSent
        self.collegeType = collegeType
        self.recordID = recordID
        self.allCollegeOrder = allCollegeOrder
        self.thinkingAboutCollegeOrder = thinkingAboutCollegeOrder
        self.appliedToCollegeOrder = appliedToCollegeOrder
        self.acceptedCollegeOrder = acceptedCollegeOrder

        
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
    var recordID : CKRecordID = CKRecordID(recordName: "whatever")
    var teacherRecDone: String = ""
    var counselorRecDone: String =  ""
    var essaysDone: String = ""
    var testSent: String = ""
    var accepted : String = ""
    var collegeType : String = ""
    var allCollegeOrder : Int64 = 0
    var thinkingAboutCollegeOrder : Int64 = 0
    var appliedToCollegeOrder : Int64 = 0
    var acceptedCollegeOrder : Int64 = 0
    
    
}
