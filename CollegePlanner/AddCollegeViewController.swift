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
    @IBOutlet weak var testType: UITextField!
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var difficulty: UITextField!
    
    @IBOutlet weak var deadlineDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    @IBAction func addButtonPressed(_
        sender: UIButton) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/YYYY HH:mm"
        addCollege.decisionDate = dateFormatter.string(from: deadlineDatePicker.date)
        addCollege.collegeName = inputtedName.text!
        addCollege.collegeLocation = inputtedLocation.text!
        addCollege.testType = testType.text!
        addCollege.login = login.text!
        addCollege.password = password.text!
        addCollege.difficulty = difficulty.text!
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
