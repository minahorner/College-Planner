//
//  ViewController.swift
//  CollegePlanner
//
//  Created by student3 on 11/18/16.
//  Copyright © 2016 John Hersey High School. All rights reserved.
//

import UIKit
import CloudKit

var something = "asdf"

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var database = CKContainer.default().privateCloudDatabase
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var collegeArray = [College]()
    var CKRecordCollege = [CKRecord]()
    
    var collegeArrays: arrayTransfer = arrayTransfer(allColleges: [], appliedColleges: [], acceptedColleges: [], applyingColleges: [], consideringColleges: [])
    @IBOutlet weak var collegeTableView: UITableView!
    @IBOutlet weak var editButton: UINavigationItem!
    var collegeType = 0
    // var chosen = 0
    
    //nav bar:42, 121, 170
    //table view: 201
    //cell: 245
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getColleges()
        print("\(collegeType) this is the college type")
        letsTry()
        something = "yep"
        //getColleges()
        print(collegeArray.count)
        //collegeArrays.allColleges.append(College(collegeName: "Tufts", studentbodyGender: "Coed", collegeLocation: "Medford, MA", testType: "ACT w/out Writing, SAT w/out Writing", decisionDate: "1/01/17", essaysRequired: "4", testPolicy: "Always Required", login: "N/A", password: "N/A", difficulty: "Reach"))
        
        //collegeArrays.allColleges[0].testSent = true
        
        //collegeArrays.applyingColleges.append(collegeArrays.allColleges[0])
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
    }
    
    /*override func viewWillAppear(_ animated: Bool) {
        getColleges()
        collegeTableView.reloadData()
        print("will")
    }
 */
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func letsTry(){
        
        //controller?.thing = "it's lit"
    }
    
    //sends to viewcontrollers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "segueToAddCollege"){
            print("yep")
            let vc = segue.destination as! AddCollegeViewController
            vc.previousTableView = self.collegeTableView
            vc.previousVC = self
            vc.database = self.database
        }
        if(segue.identifier == "segueToDetailed"){
            let vc = segue.destination as! collegeDetailedViewController
            vc.collegeArray = self.collegeArray
            vc.chosen = (collegeTableView.indexPathForSelectedRow?.row)!
            vc.previousVC = self
        }
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.collegeTableView.setEditing(editing, animated: animated)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return collegeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = collegeTableView.dequeueReusableCell(withIdentifier: "collegeCell", for: indexPath)
        cell.textLabel?.text = collegeArray[(indexPath as NSIndexPath).row].collegeName
        return cell
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedCollege = collegeArray[sourceIndexPath.row]
        let movedCKRecord = CKRecordCollege[sourceIndexPath.row]
        collegeArray.remove(at: sourceIndexPath.row)
        collegeArray.insert(movedCollege, at: destinationIndexPath.row)
        CKRecordCollege.remove(at: sourceIndexPath.row)
        CKRecordCollege.insert(movedCKRecord, at: destinationIndexPath.row)
        //add save function to save order of college
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            print("doing")
            collegeArray.remove(at: indexPath.row)
            CKRecordCollege.remove(at: indexPath.row)
            collegeTableView.reloadData()
        }
    }
    
    func getColleges(){
        
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "College", predicate: predicate)
        
        database.perform(query, inZoneWith: nil) { (records, error) in
            
            for college in records!{
                let name = college.object(forKey: "name") as! String
                let location = college.object(forKey: "location") as! String
                let testType = college.object(forKey: "test") as! String
                let decisionDate = college.object(forKey: "decisionDate") as! String
                let essaysRequired = college.object(forKey: "essaysRequired") as! String
                let counselorRecNeeded = college.object(forKey: "counselorRec") as! String
                let teacherRecNeeded = college.object(forKey: "teacherRec") as! String
                let login = college.object(forKey: "login") as! String
                let password = college.object(forKey: "password") as! String
                let difficulty = college.object(forKey: "difficulty") as! String
                let teacherRecDone = college.object(forKey: "teacherRecDone") as! String
                let counselorRecDone = college.object(forKey: "counselorRecDone") as! String
                let essaysDone = college.object(forKey: "essaysDone") as! String
                let testSent = college.object(forKey: "testSent") as! String
                let accepted = college.object(forKey: "accepted") as! String
                
                let currentCollege = College(collegeName: name, collegeLocation: location, testType: testType, decisionDate: decisionDate, essaysRequired: essaysRequired, login: login, password: password, difficulty: difficulty, counselorRecNeeded: counselorRecNeeded, counselorRecDone: counselorRecDone, teacherRecNeeded: teacherRecNeeded, teacherRecDone: teacherRecDone, essaysDone: essaysDone, testSent: testSent, accepted: accepted)
                
                if self.collegeType == 0 || (self.collegeType == 3 && currentCollege.accepted == "1"){
                self.collegeArray.append(currentCollege)
                }
                
            }
            
            self.CKRecordCollege = records!
            
            DispatchQueue.main.async {
                self.collegeTableView.reloadData()
            }
        }
    }
    func updateOrder(){
        let modify = CKModifyRecordsOperation(recordsToSave: CKRecordCollege, recordIDsToDelete: nil)
        modify.recordsToSave = CKRecordCollege
    }
}

