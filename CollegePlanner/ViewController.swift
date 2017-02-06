//
//  ViewController.swift
//  CollegePlanner
//
//  Created by student3 on 11/18/16.
//  Copyright © 2016 John Hersey High School. All rights reserved.
//

import UIKit

var something = "asdf"

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
   
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    
    var collegeArrays: arrayTransfer = arrayTransfer(allColleges: [], appliedColleges: [], acceptedColleges: [], applyingColleges: [], consideringColleges: [])
    @IBOutlet weak var collegeTableView: UITableView!
    @IBOutlet weak var editButton: UINavigationItem!
   // var chosen = 0
    
    //939393
    //00B1B7
    //E5E5E
    
    override func viewDidLoad() {
        super.viewDidLoad()
        letsTry()
        something = "yep"
        
        collegeArrays.allColleges.append(College(collegeName: "Tufts", studentbodyGender: "Coed", collegeLocation: "Medford, MA", testType: "ACT w/out Writing, SAT w/out Writing", decisionDate: "1/01/17", essaysRequired: "4", testPolicy: "Always Required", login: "N/A", password: "N/A", difficulty: "Reach"))
        
        collegeArrays.allColleges[0].testSent = true
        
        collegeArrays.applyingColleges.append(collegeArrays.allColleges[0])
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }

    }

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
            vc.collegeArrays = collegeArrays
            vc.previousTableView = self.collegeTableView
        }
        if(segue.identifier == "segueToDetailed"){
            let vc = segue.destination as! collegeDetailedViewController
            vc.collegeArrays = self.collegeArrays
            vc.chosen = (collegeTableView.indexPathForSelectedRow?.row)!
            vc.previousVC = self
        }
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.collegeTableView.setEditing(editing, animated: animated)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return collegeArrays.allColleges.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = collegeTableView.dequeueReusableCell(withIdentifier: "collegeCell", for: indexPath)
        cell.textLabel?.text = collegeArrays.allColleges[indexPath.row].collegeName
        return cell
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedCollege = collegeArrays.allColleges[sourceIndexPath.row]
        collegeArrays.allColleges.remove(at: sourceIndexPath.row)
        collegeArrays.allColleges.insert(movedCollege, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            print("doing")
            collegeArrays.allColleges.remove(at: indexPath.row)
            collegeTableView.reloadData()
        }
    }
    
   }

