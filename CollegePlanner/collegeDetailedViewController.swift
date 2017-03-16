//
//  collegeDetailedViewController.swift
//  CollegePlanner
//
//  Created by student3 on 11/21/16.
//  Copyright © 2016 John Hersey High School. All rights reserved.
//

import UIKit
import CloudKit

class collegeDetailedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, sendBackDateDelegate {

    @IBOutlet weak var schoolLocation: UILabel!
    @IBOutlet weak var schoolName: UILabel!
    @IBOutlet weak var testType: UILabel!
   
    @IBOutlet weak var login: UILabel!
    @IBOutlet weak var password: UILabel!
    @IBOutlet weak var difficulty: UILabel!
    @IBOutlet weak var deadline: UILabel!
    @IBOutlet weak var collegeTypeLabel: UILabel!
    
    
    @IBOutlet weak var schoolName_TextField: UITextField!
    @IBOutlet weak var location_TextField: UITextField!
    @IBOutlet weak var testType_TextField: UITextField!
    @IBOutlet weak var login_TextField: UITextField!
    @IBOutlet weak var password_TextField: UITextField!
    @IBOutlet weak var difficulty_TextField: UITextField!
    
    
    @IBOutlet weak var changeDeadline: UIButton!
    @IBOutlet weak var thinkingAboutButton: UIButton!
    @IBOutlet weak var applyingToButton: UIButton!
    @IBOutlet weak var acceptedButton: UIButton!
    
    var originalName = ""
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    var collegeArray : [College] = [College]()
    var editButton1 = 0
    
    
    var checklist = ["Tests", "Essays", "Counselor Rec", "Teacher Rec"]
    var collegeChecklist: [String] = []
   
    @IBOutlet weak var checklistTableView: UITableView!
    
    var previousVC : ViewController!
    var chosen = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collegeChecklist = [collegeArray[chosen].testSent, collegeArray[chosen].essaysDone, collegeArray[chosen].counselorRecDone, collegeArray[chosen].teacherRecDone]
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        var frameRect = schoolName_TextField.frame
        frameRect.size.height = 47; // <-- Specify the height you want here.
        
        schoolName_TextField.frame = frameRect;
        
        hide(value: 0) //hide editing
        
        schoolName.text = collegeArray[chosen].collegeName
        schoolLocation.text = collegeArray[chosen].collegeLocation
        testType.text = collegeArray[chosen].testType
        login.text = collegeArray[chosen].login
        password.text = collegeArray[chosen].password
        difficulty.text = collegeArray[chosen].difficulty
        deadline.text = collegeArray[chosen].decisionDate
        
        schoolName_TextField.text = collegeArray[chosen].collegeName
        location_TextField.text = collegeArray[chosen].collegeLocation
        login_TextField.text = collegeArray[chosen].login
        testType_TextField.text = collegeArray[chosen].testType
        login_TextField.text = collegeArray[chosen].login
        password_TextField.text = collegeArray[chosen].password
        difficulty_TextField.text = collegeArray[chosen].difficulty
        
        
        changeDeadline.setTitle(deadline.text, for: .normal)
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
        originalName = collegeArray[chosen].collegeName
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
   
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if(segue.identifier == "segueToEdit"){
//        let vc = segue.destination as! EditCollegeViewController
//        vc.collegeArrays = collegeArrays
//        vc.chosen = chosen
//        vc.name = schoolName.text!
//        vc.location = schoolLocation.text!
//        vc.localLogin = login.text!
//        vc.localPassword = password.text!
//        vc.localDifficulty = difficulty.text!
//        vc.localDeadline = deadline.text!
//        vc.previousVC = self.previousVC
//        vc.detailedVC = self
//        }
//    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = checklistTableView.cellForRow(at: indexPath) {
            if(cell.accessoryType != .checkmark){
            cell.accessoryType = .checkmark
            collegeChecklist[indexPath.row] = "1"
                
                
            }else{
                cell.accessoryType = .none
                collegeChecklist[indexPath.row] = "0"
            }
            refreshChecklist()
            updateCloud()
        }
    }
    
 /*
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = checklistTableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }

    }
 */
    
    func refreshChecklist(){
        print("\(collegeChecklist[0])" + "This is the refresh Checklist")
        collegeArray[chosen].testSent = collegeChecklist[0]
        collegeArray[chosen].essaysDone = collegeChecklist[1]
        collegeArray[chosen].counselorRecDone = collegeChecklist[2]
        collegeArray[chosen].teacherRecDone = collegeChecklist[3]
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = checklistTableView.dequeueReusableCell(withIdentifier: checklist[indexPath.row], for: indexPath)
        if(collegeChecklist[indexPath.row] == "1"){
            cell.accessoryType = .checkmark
        }
        //print(cell.reuseIdentifier)
        //cell.accessoryType = .checkmark
        //checkCheckmark(indexPath: indexPath)
        //cell.accessoryType = .checkmark

        return cell
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        print("work")
        if(editButton1 == 0){
            super.setEditing(editing, animated: animated)
            print("works")
            editButton1 = 1
            
            hide(value: 1)//show editing
            
        }
        else{
            super.setEditing(editing, animated: animated)
            
            hide(value: 0)//hide editing
            
            testType.text = testType_TextField.text
            
            collegeArray[chosen].collegeName = schoolName_TextField.text!
            collegeArray[chosen].collegeLocation = location_TextField.text!
            collegeArray[chosen].login = login_TextField.text!
            collegeArray[chosen].password = password_TextField.text!
            collegeArray[chosen].difficulty = difficulty_TextField.text!
            collegeArray[chosen].testType = testType_TextField.text!
            
            schoolName.text = collegeArray[chosen].collegeName
            schoolLocation.text = collegeArray[chosen].collegeLocation
            login.text = collegeArray[chosen].login
            password.text = collegeArray[chosen].password
            difficulty.text = collegeArray[chosen].difficulty
            deadline.text = collegeArray[chosen].decisionDate
            testType.text = collegeArray[chosen].testType
            previousVC.collegeTableView.reloadData()
            editButton1 = 0
            updateCloud()
            
            
        }
    }
    
    @IBAction func thinkingPressed(_ sender: UIButton) {
        collegeTypeLabel.text = "Thinking About"
        thinkingAboutButton.backgroundColor = UIColor.cyan
        applyingToButton.backgroundColor = UIColor.clear
        acceptedButton.backgroundColor = UIColor.clear
    }
    @IBAction func applyingPressed(_ sender: UIButton) {
        collegeTypeLabel.text = "Applying To"
        thinkingAboutButton.backgroundColor = UIColor.clear
        applyingToButton.backgroundColor = UIColor.cyan
        acceptedButton.backgroundColor = UIColor.clear
        
    }
    @IBAction func acceptedPressed(_ sender: UIButton) {
        collegeTypeLabel.text = "Accepted"
        thinkingAboutButton.backgroundColor = UIColor.clear
        applyingToButton.backgroundColor = UIColor.clear
        acceptedButton.backgroundColor = UIColor.cyan
    }
    
    
    func hide(value:Int){
        if(value == 1){
            schoolName_TextField.isHidden = false
            location_TextField.isHidden = false
            testType_TextField.isHidden = false
            login_TextField.isHidden = false
            password_TextField.isHidden = false
            difficulty_TextField.isHidden = false
            changeDeadline.isHidden = false
            thinkingAboutButton.isHidden = false
            applyingToButton.isHidden = false
            acceptedButton.isHidden = false
            //testType_TextField.isHidden = false
            changeDeadline.setTitle(deadline.text, for: .normal)
            changeDeadline.isEnabled = true
            schoolName.isHidden = true
            schoolLocation.isHidden = true
            testType.isHidden = true
            login.isHidden = true
            password.isHidden = true
            difficulty.isHidden = true
            deadline.isHidden = true
            collegeTypeLabel.isHidden = true
        }else if(value == 0){
            schoolName_TextField.isHidden = true
            location_TextField.isHidden = true
            testType_TextField.isHidden = true
            login_TextField.isHidden = true
            password_TextField.isHidden = true
            difficulty_TextField.isHidden = true
            thinkingAboutButton.isHidden = true
            applyingToButton.isHidden = true
            acceptedButton.isHidden = true
            changeDeadline.isHidden = true
            changeDeadline.isEnabled = false
            schoolName.isHidden = false
            schoolLocation.isHidden = false
            testType.isHidden = false
            login.isHidden = false
            password.isHidden = false
            difficulty.isHidden = false
            deadline.isHidden = false
            collegeTypeLabel.isHidden = false
            //testType.isHidden = false
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? DatePickerViewController
        vc?.stringDate = deadline.text!
        vc?.previousVC = self
    }
    
    func sendDate(date Date: String){
        self.deadline.text = Date
        self.changeDeadline.setTitle(Date, for: .normal)
        print(deadline.text)
        self.viewDidLoad()
    }
    
    func updateCloud(){
        
        let ID = CKRecordID(recordName: collegeArray[chosen].recordID)
        let place = CKRecord(recordType: "College", recordID: ID)
        let modifyRecords = CKModifyRecordsOperation(recordsToSave: [place], recordIDsToDelete: nil)
        modifyRecords.savePolicy = CKRecordSavePolicy.allKeys
        modifyRecords.qualityOfService = QualityOfService.userInitiated
        place.setObject(collegeArray[chosen].collegeName as CKRecordValue?, forKey: "name")
        place.setObject(collegeArray[chosen].collegeLocation as CKRecordValue?, forKey: "location")
        place.setObject(collegeArray[chosen].login as CKRecordValue?, forKey: "login")
        place.setObject(collegeArray[chosen].password as CKRecordValue?, forKey: "password")
        place.setObject(collegeArray[chosen].difficulty as CKRecordValue?, forKey: "difficulty")
        place.setObject(collegeArray[chosen].decisionDate as CKRecordValue?, forKey: "decisionDate")
        place.setObject(collegeArray[chosen].testType as CKRecordValue?, forKey: "test")
        place.setObject(collegeArray[chosen].essaysRequired as CKRecordValue?, forKey: "essaysRequired")
        place.setObject(collegeArray[chosen].essaysDone as CKRecordValue?, forKey: "essaysDone")
        place.setObject(collegeArray[chosen].counselorRecNeeded as CKRecordValue?, forKey: "counselorRec")
        place.setObject(collegeArray[chosen].counselorRecDone as CKRecordValue?, forKey: "counselorRecDone")
        place.setObject(collegeArray[chosen].teacherRecNeeded as CKRecordValue?, forKey: "teacherRec")
        place.setObject(collegeArray[chosen].teacherRecDone as CKRecordValue?, forKey: "teacherRecDone")
        place.setObject(collegeArray[chosen].testSent as CKRecordValue?, forKey: "testSent")
        modifyRecords.modifyRecordsCompletionBlock = { savedRecords, ID, error in
            if error == nil {
                print("Modified")
            }
            else {
                print(error)
            }
        }
        previousVC.database.add(modifyRecords)
    }
}

