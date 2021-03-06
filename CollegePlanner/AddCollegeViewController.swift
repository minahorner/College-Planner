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
    var thisdate = Date()
    
    @IBOutlet weak var inputtedName: UITextField!
    @IBOutlet weak var inputtedLocation: UITextField!
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var difficulty: UITextField!
    
    @IBOutlet weak var deadlineDatePicker: UIDatePicker!
    
    @IBOutlet weak var inputtedTest: UITextField!
    
    @IBOutlet weak var applyingToButton: UIButton!
    @IBOutlet weak var acceptedButton: UIButton!
    @IBOutlet weak var thinkingAboutButton: UIButton!
    var temp1 = 0
    var temp2 = 0
    var temp3 = 0
    var finalPress = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.barStyle = UIBarStyle.black
        navigationBar.tintColor = UIColor.white
        
    }
    
    @IBAction func datePickerPressed(_ sender: UIDatePicker) {
        thisdate = sender.date
    }
    
    
    
    @IBAction func addButtonPressed(_
        sender: UIButton) {
        //need to add the option to put in inputted information for number of essays and number of teacher recs needed
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/YYYY HH:mma"
        addCollege.decisionDate = dateFormatter.string(from: thisdate)
        addCollege.collegeName = inputtedName.text!
        addCollege.collegeLocation = inputtedLocation.text!
        addCollege.testType = inputtedTest.text!
        addCollege.login = login.text!
        addCollege.password = password.text!
        addCollege.difficulty = difficulty.text!
        addCollege.testType = inputtedTest.text!
        addCollege.counselorRecDone =  "0"
        //addCollege.counselorRecNeeded = numOfCounselorRecs.text!
        addCollege.teacherRecDone = "0"
        //addCollege.teacherRecNeeded = numOfTeacherRecs.text!
        addCollege.testSent = "0"
        addCollege.essaysDone = "0"
        //addCollege.essaysRequired = numOfEssays.text!
        addCollege.teacherRecNeeded = "0"
        
        //stringDate = date.description
        
        
        
        
        //addCollege.teacherRecNeeded = false
        //addCollege.teacherRecDone = false
        //addCollege.counselorRecDone = false
        //addCollege.counselorRecNeeded = false
        //addCollege.essaysDone = false
        //addCollege.essaysRequired = ""
        //addCollege.accepted = false
        previousVC.collegeArray.append(addCollege)
        updateCloud(newCollege: addCollege)
        previousVC.collegeTableView.reloadData()
        self.dismiss(animated: true, completion: nil)
        
        let calendar = Calendar.current
        
        thisdate = calendar.date(byAdding: .day, value: -14, to: thisdate)!
        
        
        let delegate = UIApplication.shared.delegate as? AppDelegate
        
        
        
        delegate?.scheduleNotification(at: thisdate, school: (addCollege.collegeName))
        
               
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func thinkingPressed(_ sender: UIButton) {
        addCollege.collegeType = "1"
        thinkingAboutButton.backgroundColor = UIColor.cyan
        applyingToButton.backgroundColor = UIColor.clear
        acceptedButton.backgroundColor = UIColor.clear
        //alter college here
        
    }
    @IBAction func applyingPressed(_ sender: UIButton) {
        addCollege.collegeType = "2"
        thinkingAboutButton.backgroundColor = UIColor.clear
        applyingToButton.backgroundColor = UIColor.cyan
        acceptedButton.backgroundColor = UIColor.clear
        //alter college here
    }
    @IBAction func acceptedPressed(_ sender: UIButton) {
        addCollege.collegeType = "3"
        thinkingAboutButton.backgroundColor = UIColor.clear
        applyingToButton.backgroundColor = UIColor.clear
        acceptedButton.backgroundColor = UIColor.cyan
        //alter college here
        
    }
   
    
    
    
    
    @IBAction func cancel(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func updateCloud(newCollege : College){
        let place = CKRecord(recordType: "College")
        place.setObject(newCollege.collegeName as CKRecordValue?, forKey: "name")
        place.setObject(newCollege.collegeLocation as CKRecordValue?, forKey: "location")
        place.setObject(newCollege.login as CKRecordValue?, forKey: "login")
        place.setObject(newCollege.password as CKRecordValue?, forKey: "password")
        place.setObject(newCollege.difficulty as CKRecordValue?, forKey: "difficulty")
        place.setObject(newCollege.decisionDate as CKRecordValue?, forKey: "decisionDate")
        place.setObject(newCollege.testType as CKRecordValue?, forKey: "test")
        place.setObject(newCollege.essaysRequired as CKRecordValue?, forKey: "essaysRequired")
        place.setObject("0" as CKRecordValue?, forKey: "essaysDone")
        place.setObject(newCollege.counselorRecNeeded as CKRecordValue?, forKey: "counselorRec")
        place.setObject("0" as CKRecordValue?, forKey: "counselorRecDone")
        place.setObject(newCollege.teacherRecNeeded as CKRecordValue?, forKey: "teacherRec")
        place.setObject("0" as CKRecordValue?, forKey: "teacherRecDone")
        place.setObject("0" as CKRecordValue?, forKey: "testSent")
        place.setObject(newCollege.collegeType as CKRecordValue, forKey: "collegeType")
        //place.setObject((place.recordID as! String) as CKRecordValue, forKey: "RecordID")
//        place.setObject(newCollege.allCollegeOrder as CKRecordValue?, forKey: "allCollegeOrder")
//        place.setObject(newCollege.thinkingAboutCollegeOrder as CKRecordValue?, forKey: "thinkingAboutCollegesOrder")
//        place.setObject(newCollege.appliedToCollegeOrder as CKRecordValue?, forKey: "applyingToCollegesOrder")
//        place.setObject(newCollege.acceptedCollegeOrder as CKRecordValue?, forKey: "acceptedCollegesOrder")
        database.save(place) { (record, error) in
            if(error == nil){
                print("saved")
            }
            else{
                print(error)
            }
        }
    }
}
