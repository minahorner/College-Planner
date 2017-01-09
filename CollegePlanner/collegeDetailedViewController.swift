//
//  collegeDetailedViewController.swift
//  CollegePlanner
//
//  Created by student3 on 11/21/16.
//  Copyright © 2016 John Hersey High School. All rights reserved.
//

import UIKit

class collegeDetailedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var schoolLocation: UILabel!
    @IBOutlet weak var schoolName: UILabel!
    @IBOutlet weak var TestPolicy: UILabel!
    @IBOutlet weak var login: UILabel!
    @IBOutlet weak var password: UILabel!
    @IBOutlet weak var difficulty: UILabel!
    @IBOutlet weak var deadline: UILabel!
    
    
    
    var checklist = ["Tests", "Essays", "Counselor Rec", "Teacher Rec", "Acceptance"]
    var collegeChecklist: [Bool] = []
   
    @IBOutlet weak var checklistTableView: UITableView!
    var collegeArrays : arrayTransfer = arrayTransfer()
    
    var previousVC : ViewController!
    var chosen = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collegeChecklist = [collegeArrays.allColleges[chosen].testSent, collegeArrays.allColleges[chosen].essaysDone, collegeArrays.allColleges[chosen].counselorRecDone, collegeArrays.allColleges[chosen].teacherRecDone, collegeArrays.allColleges[chosen].accepted]
        
       
        schoolName.text = collegeArrays.allColleges[chosen].collegeName
        schoolLocation.text = collegeArrays.allColleges[chosen].collegeLocation
        TestPolicy.text = collegeArrays.allColleges[chosen].testPolicy
        login.text = collegeArrays.allColleges[chosen].login
        password.text = collegeArrays.allColleges[chosen].password
        difficulty.text = collegeArrays.allColleges[chosen].difficulty
        deadline.text = collegeArrays.allColleges[chosen].decisionDate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "segueToEdit"){
        let vc = segue.destination as! EditCollegeViewController
        vc.collegeArrays = collegeArrays
        vc.chosen = chosen
        vc.name = schoolName.text!
        vc.location = schoolLocation.text!
        vc.localLogin = login.text!
        vc.localPassword = password.text!
        vc.localDifficulty = difficulty.text!
        vc.localDeadline = deadline.text!
        vc.previousVC = self.previousVC
        vc.detailedVC = self
        }
    }
    
    
    
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

}
