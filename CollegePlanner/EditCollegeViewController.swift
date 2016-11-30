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
    var previousVC = ViewController()
    var detailedVC = collegeDetailedViewController()
    var name = ""
    var location = ""
    var chosen = 0
    @IBOutlet weak var collegeLocation: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collegeName.text = name
        collegeLocation.text = location
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func editInfo(_ sender: UIButton) {
        collegeArrays.allColleges[chosen].collegeName = collegeName.text!
        collegeArrays.allColleges[chosen].collegeLocation = collegeLocation.text!
        previousVC.collegeTableView.reloadData()
        detailedVC.viewDidLoad()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
