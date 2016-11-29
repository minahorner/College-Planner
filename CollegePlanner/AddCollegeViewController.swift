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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        addCollege.collegeName = inputtedName.text!
        collegeArrays.allColleges.append(addCollege)
        previousTableView.reloadData()
        self.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
