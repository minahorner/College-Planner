//
//  collegeDetailedViewController.swift
//  CollegePlanner
//
//  Created by student3 on 11/21/16.
//  Copyright © 2016 John Hersey High School. All rights reserved.
//

import UIKit

class collegeDetailedViewController: UIViewController {

    @IBOutlet weak var schoolLocation: UILabel!
    @IBOutlet weak var schoolName: UILabel!
    var collegeArrays : arrayTransfer = arrayTransfer()
    var previousVC : ViewController!
    var chosen = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        schoolName.text = collegeArrays.allColleges[chosen].collegeName
        schoolLocation.text = collegeArrays.allColleges[chosen].collegeLocation
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
        vc.previousVC = self.previousVC
        vc.detailedVC = self
    }
    }
}
