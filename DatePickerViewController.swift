//
//  DatePickerViewController.swift
//  CollegePlanner
//
//  Created by student3 on 2/2/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    
    var date = Date()
    var stringDate = "nope"
    var previousVC: collegeDetailedViewController?
    
    var thing: sendBackDateDelegate?

    
    @IBAction func datePickerPressed(_ sender: UIDatePicker) {
        
        date = sender.date
        stringDate = date.description
        
        let delegate = UIApplication.shared.delegate as? AppDelegate
        delegate?.scheduleNotification(at: sender.date)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func donePressed(_ sender: UIButton) {
        stringDate = date.description
        //thing?.sendDate(date: stringDate)
        print(stringDate)
        previousVC?.changeDeadline.setTitle(stringDate, for: .normal)
        previousVC?.deadline.text = stringDate
       previousVC?.collegeArrays.allColleges[(previousVC?.chosen)!].decisionDate = stringDate
        print(stringDate)
        self.dismiss(animated: true) { 
            
        }
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
