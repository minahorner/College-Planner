//
//  AddCollegeViewController.swift
//  CollegePlanner
//
//  Created by student3 on 11/28/16.
//  Copyright © 2016 John Hersey High School. All rights reserved.
//

import UIKit
import CloudKit

class AddCollegeViewController: UIViewController {
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    var previousVC = ViewController()
    var addCollege: College = College()
    var previousTableView = UITableView()
    var database = CKContainer.default().privateCloudDatabase
    
    @IBOutlet weak var inputtedName: UITextField!
    @IBOutlet weak var inputtedLocation: UITextField!
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var difficulty: UITextField!
    
    @IBOutlet weak var deadlineDatePicker: UIDatePicker!
    
    @IBOutlet weak var inputtedTest: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.barStyle = UIBarStyle.black
        navigationBar.tintColor = UIColor.white
        
    }
    
    
    @IBAction func addButtonPressed(_
        sender: UIButton) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/YYYY HH:mm"
        addCollege.decisionDate = dateFormatter.string(from: deadlineDatePicker.date)
        addCollege.collegeName = inputtedName.text!
        addCollege.collegeLocation = inputtedLocation.text!
        addCollege.login = login.text!
        addCollege.password = password.text!
        addCollege.difficulty = difficulty.text!
        addCollege.testType = inputtedTest.text!
        addCollege.accepted = "2"
        addCollege.counselorRecDone =  "2"
        addCollege.counselorRecNeeded = "2"
        addCollege.teacherRecDone = "2"
        addCollege.teacherRecNeeded = "2"
        addCollege.testSent = "2"
        addCollege.essaysDone = "2"
        
        //addCollege.teacherRecNeeded = false
        //addCollege.teacherRecDone = false
        //addCollege.counselorRecDone = false
        //addCollege.counselorRecNeeded = false
        //addCollege.essaysDone = false
        //addCollege.essaysRequired = ""
        //addCollege.accepted = false
        previousVC.collegeArray.append(addCollege)
        updateCloud(newCollege: addCollege)
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func updateCloud(newCollege : College){
        let ID = CKRecordID(recordName: newCollege.collegeName)
        let place = CKRecord(recordType: "College", recordID: ID)
        place.setObject(newCollege.collegeName as CKRecordValue?, forKey: "name")
        place.setObject(newCollege.collegeLocation as CKRecordValue?, forKey: "location")
        place.setObject(newCollege.login as CKRecordValue?, forKey: "login")
        place.setObject(newCollege.password as CKRecordValue?, forKey: "password")
        place.setObject(newCollege.difficulty as CKRecordValue?, forKey: "difficulty")
        place.setObject(newCollege.decisionDate as CKRecordValue?, forKey: "decisionDate")
        place.setObject(newCollege.testType as CKRecordValue?, forKey: "test")
        place.setObject("2" as CKRecordValue?, forKey: "accepted")
        place.setObject("2" as CKRecordValue?, forKey: "essaysRequired")
        place.setObject("2" as CKRecordValue?, forKey: "essaysDone")
        place.setObject("2" as CKRecordValue?, forKey: "counselorRec")
        place.setObject("2" as CKRecordValue?, forKey: "counselorRecDone")
        place.setObject("2" as CKRecordValue?, forKey: "teacherRec")
        place.setObject("2" as CKRecordValue?, forKey: "teacherRecDone")
        place.setObject("2" as CKRecordValue?, forKey: "testSent")
        database.save(place) { (record, error) in
            if(error == nil){
                print("saved")
            }
            else{
                print("error")
                print(error)
            }
        }
    }
    
}
