//
//  AddCollegeViewController.swift
//  CollegePlanner
//
//  Created by student3 on 11/28/16.
//  Copyright © 2016 John Hersey High School. All rights reserved.
//

import UIKit

class AddCollegeViewController: UIViewController {
    
    var collegeArrays: arrayTransfer = arrayTransfer()
    var addCollege: College = College()
    var previousTableView = UITableView()
    @IBOutlet weak var inputtedName: UITextField!
    @IBOutlet weak var inputtedLocation: UITextField!
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var difficulty: UITextField!
    @IBOutlet weak var deadline: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        addCollege.collegeName = inputtedName.text!
        addCollege.collegeLocation = inputtedLocation.text!
        addCollege.login = login.text!
        addCollege.password = password.text!
        addCollege.difficulty = difficulty.text!
        addCollege.decisionDate = deadline.text!
        collegeArrays.allColleges.append(addCollege)
        previousTableView.reloadData()
        self.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
