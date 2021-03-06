//
//  DatePickerViewController.swift
//  CollegePlanner
//
//  Created by student3 on 2/2/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit


class DatePickerViewController: UIViewController {
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    var date = Date()
    var stringDate = "nope"
    var previousVC: collegeDetailedViewController?
    var dateFormatter = DateFormatter()
    
    var thing: sendBackDateDelegate?

    
    @IBAction func datePickerPressed(_ sender: UIDatePicker) {
        
        date = sender.date
        print("this")
        print(sender.date)
        print("current")
        print(Date())
   
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.barStyle = UIBarStyle.black
        navigationBar.tintColor = UIColor.white
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func donePressed(_ sender: UIButton) {
        dateFormatter.dateFormat = "MM/dd/YYYY HH:mma"
        stringDate = dateFormatter.string(from: date)
        //stringDate = date.description
        
        previousVC?.changeDeadline.setTitle(stringDate, for: .normal)
        previousVC?.deadline.text = stringDate
       previousVC?.collegeArray[(previousVC?.chosen)!].decisionDate = stringDate
       
        print("this")
                
        let calendar = Calendar.current
        date = calendar.date(byAdding: .day, value: -14, to: date)!
        let delegate = UIApplication.shared.delegate as? AppDelegate
        
        delegate?.scheduleNotification(at: date, school: (previousVC?.collegeArray[(previousVC?.chosen)!].collegeName)!)
        self.dismiss(animated: true) { 
        }
        
        print(date.description)
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
