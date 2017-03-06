//
//  AutoViewController.swift
//  CollegePlanner
//
//  Created by student3 on 1/10/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit

class AutoViewController: UIViewController {

    
    var collegeArrays: arrayTransfer = arrayTransfer(allColleges: [], appliedColleges: [], acceptedColleges: [], applyingColleges: [], consideringColleges: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collegeArrays.allColleges.append(College())
        collegeArrays.allColleges[0].collegeName = "help"
        print("here")
        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(moveOn), userInfo: nil, repeats: false)
        print("what")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func moveOn(){
        self.performSegue(withIdentifier: "toNav", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination.childViewControllers[0] as! ViewController
        print("in prepare")
        vc.collegeArrays = self.collegeArrays
        print(vc.collegeArrays.allColleges[0].collegeName)
        
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
