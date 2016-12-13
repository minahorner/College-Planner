//
//  EditCollegeViewController.swift
//  CollegePlanner
//
//  Created by student3 on 11/29/16.
//  Copyright © 2016 John Hersey High School. All rights reserved.
//

import UIKit

class EditCollegeViewController: UIViewController {
    
    var collegeArrays: arrayTransfer = arrayTransfer()
    @IBOutlet weak var collegeName: UITextField!
    @IBOutlet weak var collegeLocation: UITextField!
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var difficulty: UITextField!
    @IBOutlet weak var deadline: UITextField!
    var previousVC = ViewController()
    var detailedVC = collegeDetailedViewController()
    var name = ""
    var location = ""
    var localLogin = ""
    var localPassword = ""
    var localDifficulty = ""
    var localDeadline = ""
    var chosen = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        collegeName.text = name
        collegeLocation.text = location
        login.text = localLogin
        password.text = localPassword
        difficulty.text = localDifficulty
        deadline.text = localDeadline
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func editInfo(_ sender: UIButton) {
        collegeArrays.allColleges[chosen].collegeName = collegeName.text!
        collegeArrays.allColleges[chosen].collegeLocation = collegeLocation.text!
        collegeArrays.allColleges[chosen].login = login.text!
        collegeArrays.allColleges[chosen].password = password.text!
        collegeArrays.allColleges[chosen].difficulty = difficulty.text!
        collegeArrays.allColleges[chosen].decisionDate = deadline.text!
        previousVC.collegeTableView.reloadData()
        detailedVC.viewDidLoad()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
