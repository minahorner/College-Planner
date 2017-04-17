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

//41, 121, 170

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var database = CKContainer.default().privateCloudDatabase
    
    var ckRecordsArray : [CKRecord] = []
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var collegeArray = [College]()
    var arrayOfIDs = [CKRecordID]()
    
    @IBOutlet weak var collegeTableView: UITableView!
    @IBOutlet weak var editButton: UINavigationItem!
    var collegeTypePage = 0
    
    @IBOutlet weak var add: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getColleges()
        something = "yep"
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
            var num = (collegeTableView.indexPathForSelectedRow?.row)!
            let vc = segue.destination as! collegeDetailedViewController
            vc.collegeArray = self.collegeArray
            vc.chosen = (collegeTableView.indexPathForSelectedRow?.row)!
            vc.previousVC = self
        }
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.collegeTableView.setEditing(editing, animated: animated)
        if(editing){
            add.isEnabled = false
        }
        else{
            add.isEnabled = true
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return collegeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = collegeTableView.dequeueReusableCell(withIdentifier: "collegeCell", for: indexPath)
        cell.textLabel?.text = collegeArray[(indexPath as NSIndexPath).row].collegeName
        return cell
    }
    
    
    //func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    //    let movedCollege = collegeArray[sourceIndexPath.row]
    //    collegeArray.remove(at: sourceIndexPath.row)
    //    collegeArray.insert(movedCollege, at: destinationIndexPath.row)
    //add save function to save order of college
    //}
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            print("doing")
            let record = CKRecordID(recordName: collegeArray[indexPath.row].recordID)
            database.delete(withRecordID: record) { (ID, error) in
                if error == nil{
                    print("Deleted")
                }
                else{
                    print(error)
                }
            }
            self.collegeArray.remove(at: indexPath.row)
            collegeTableView.reloadData()
        }
    }
    
    func getColleges(){
        
        collegeArray = []
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
                let collegeType = college.object(forKey: "collegeType") as! String
                //                let allCollegeOrder = college.object(forKey: "allCollegeOrder") as! Int64
                //                let thinkingAboutCollegeOrder = college.object(forKey: "thinkingAboutCollegesOrder") as! Int64
                //                let appliedToCollegeOrder = college.object(forKey: "applyingToCollegesOrder") as! Int64
                //                let acceptedCollegeOrder = college.object(forKey: "acceptedCollegesOrder") as! Int64
                let currentCollege = College(collegeName: name, collegeLocation: location, testType: testType, decisionDate: decisionDate, essaysRequired: essaysRequired, login: login, password: password, difficulty: difficulty, counselorRecNeeded: counselorRecNeeded, counselorRecDone: counselorRecDone, teacherRecNeeded: teacherRecNeeded, teacherRecDone: teacherRecDone, essaysDone: essaysDone, testSent: testSent, collegeType : collegeType, allCollegeOrder : 0, thinkingAboutCollegeOrder : 0, appliedToCollegeOrder : 0, acceptedCollegeOrder : 0, RecordID : college.recordID)
                
                
                
                if (self.collegeTypePage == 0 || (self.collegeTypePage == 1 && currentCollege.collegeType == "1") || (self.collegeTypePage == 2 && currentCollege.collegeType == "2") || (self.collegeTypePage == 3 && currentCollege.collegeType == "3")){
                    
                    self.collegeArray.append(currentCollege)
                }
                
                
                
            }
            DispatchQueue.main.async {
                self.collegeTableView.reloadData()
            }
            
        }
    }
}
