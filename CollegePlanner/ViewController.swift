//
//  ViewController.swift
//  CollegePlanner
//
//  Created by student3 on 11/18/16.
//  Copyright © 2016 John Hersey High School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var collegeArray: [College] = [College()]

    @IBOutlet weak var collegeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            collegeArray[0].collegeName = "Practice College"
        print(collegeArray[0].collegeName)
        collegeTableView.delegate = self
        collegeTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return collegeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = collegeTableView.dequeueReusableCell(withIdentifier: "collegeCell", for: indexPath)
        cell.textLabel?.text = collegeArray[indexPath.row].collegeName
        return cell
    }

}

