//
//  collegeDetailedViewController.swift
//  CollegePlanner
//
//  Created by student3 on 11/21/16.
//  Copyright © 2016 John Hersey High School. All rights reserved.
//

import UIKit

class collegeDetailedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, sendBackDateDelegate {

    @IBOutlet weak var schoolLocation: UILabel!
    @IBOutlet weak var schoolName: UILabel!
    @IBOutlet weak var testType: UILabel!
    
    @IBOutlet weak var login: UILabel!
    @IBOutlet weak var password: UILabel!
    @IBOutlet weak var difficulty: UILabel!
    @IBOutlet weak var deadline: UILabel!
    @IBOutlet weak var schoolName_TextField: UITextField!
    @IBOutlet weak var location_TextField: UITextField!
    @IBOutlet weak var testType_TextField: UITextField!
    
    @IBOutlet weak var login_TextField: UITextField!
    @IBOutlet weak var password_TextField: UITextField!
    @IBOutlet weak var difficulty_TextField: UITextField!
    @IBOutlet weak var changeDeadline: UIButton!
    

    @IBOutlet weak var editButton: UIBarButtonItem!
    
    var editButton1 = 0
    
    
    var checklist = ["Tests", "Essays", "Counselor Rec", "Teacher Rec", "Acceptance"]
    var collegeChecklist: [Bool] = []
   
    @IBOutlet weak var checklistTableView: UITableView!
    var collegeArrays : arrayTransfer = arrayTransfer()
    
    var previousVC : ViewController!
    var chosen = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        var frameRect = schoolName_TextField.frame
        frameRect.size.height = 47; // <-- Specify the height you want here.
        
                schoolName_TextField.frame = frameRect;
        schoolName_TextField.isHidden = true
        location_TextField.isHidden = true
        testType_TextField.isHidden = true
        login_TextField.isHidden = true
        password_TextField.isHidden = true
        difficulty_TextField.isHidden = true
        changeDeadline.isHidden = true
        changeDeadline.isEnabled = false
        collegeChecklist = [collegeArrays.allColleges[chosen].testSent, collegeArrays.allColleges[chosen].essaysDone, collegeArrays.allColleges[chosen].counselorRecDone, collegeArrays.allColleges[chosen].teacherRecDone, collegeArrays.allColleges[chosen].accepted]
        
        schoolName.text = collegeArrays.allColleges[chosen].collegeName
        schoolLocation.text = collegeArrays.allColleges[chosen].collegeLocation
        testType.text = collegeArrays.allColleges[chosen].testType
        login.text = collegeArrays.allColleges[chosen].login
        password.text = collegeArrays.allColleges[chosen].password
        difficulty.text = collegeArrays.allColleges[chosen].difficulty
        deadline.text = collegeArrays.allColleges[chosen].decisionDate
        
        schoolName_TextField.text = collegeArrays.allColleges[chosen].collegeName
        location_TextField.text = collegeArrays.allColleges[chosen].collegeLocation
        testType_TextField.text = collegeArrays.allColleges[chosen].testType
        login_TextField.text = collegeArrays.allColleges[chosen].login
        password_TextField.text = collegeArrays.allColleges[chosen].password
        difficulty_TextField.text = collegeArrays.allColleges[chosen].difficulty
        
        
        changeDeadline.setTitle(deadline.text, for: .normal)

        
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
                collegeChecklist[indexPath.row] = true
                
                
            }else{
                cell.accessoryType = .none
                collegeChecklist[indexPath.row] = false
            }
            refreshChecklist()
            print(collegeArrays.allColleges[chosen].essaysDone)
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
        collegeArrays.allColleges[chosen].testSent = collegeChecklist[0]
        collegeArrays.allColleges[chosen].essaysDone = collegeChecklist[1]
        collegeArrays.allColleges[chosen].counselorRecDone = collegeChecklist[2]
        collegeArrays.allColleges[chosen].teacherRecDone = collegeChecklist[3]
        collegeArrays.allColleges[chosen].accepted = collegeChecklist[4]
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = checklistTableView.dequeueReusableCell(withIdentifier: checklist[indexPath.row], for: indexPath)
        if(collegeChecklist[indexPath.row] == true){
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
            schoolName_TextField.isHidden = false
            location_TextField.isHidden = false
            testType_TextField.isHidden = false
            login_TextField.isHidden = false
            password_TextField.isHidden = false
            difficulty_TextField.isHidden = false
            changeDeadline.isHidden = false
            changeDeadline.setTitle(deadline.text, for: .normal)
            changeDeadline.isEnabled = true
            schoolName.isHidden = true
            schoolLocation.isHidden = true
            testType.isHidden = true
            login.isHidden = true
            password.isHidden = true
            difficulty.isHidden = true
            deadline.isHidden = true
        }
        else{
            super.setEditing(editing, animated: animated)
            schoolName_TextField.isHidden = true
            location_TextField.isHidden = true
            testType_TextField.isHidden = true
            login_TextField.isHidden = true
            password_TextField.isHidden = true
            difficulty_TextField.isHidden = true
            changeDeadline.isHidden = true
            changeDeadline.isEnabled = false
            schoolName.isHidden = false
            schoolLocation.isHidden = false
            testType.isHidden = false
            login.isHidden = false
            password.isHidden = false
            difficulty.isHidden = false
            deadline.isHidden = false
            collegeArrays.allColleges[chosen].collegeName = schoolName_TextField.text!
            collegeArrays.allColleges[chosen].collegeLocation = location_TextField.text!
            collegeArrays.allColleges[chosen].login = login_TextField.text!
            collegeArrays.allColleges[chosen].password = password_TextField.text!
            collegeArrays.allColleges[chosen].difficulty = difficulty_TextField.text!
            
            schoolName.text = collegeArrays.allColleges[chosen].collegeName
            schoolLocation.text = collegeArrays.allColleges[chosen].collegeLocation
            login.text = collegeArrays.allColleges[chosen].login
            password.text = collegeArrays.allColleges[chosen].password
            difficulty.text = collegeArrays.allColleges[chosen].difficulty
            deadline.text = collegeArrays.allColleges[chosen].decisionDate
            previousVC.collegeTableView.reloadData()
            editButton1 = 0
            
            
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
    

}
