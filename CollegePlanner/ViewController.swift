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
    
    @IBOutlet weak var editButton: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            collegeArray[0].collegeName = "Practice College"
        print(collegeArray[0].collegeName)
        
        collegeTableView.delegate = self
        collegeTableView.dataSource = self
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.collegeTableView.setEditing(editing, animated: animated)
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return collegeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = collegeTableView.dequeueReusableCell(withIdentifier: "collegeCell", for: indexPath)
        cell.textLabel?.text = collegeArray[indexPath.row].collegeName
        return cell
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedCollege = collegeArray[sourceIndexPath.row]
        collegeArray.remove(at: sourceIndexPath.row)
        collegeArray.insert(movedCollege, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            print("doing")
            collegeArray.remove(at: indexPath.row)
            collegeTableView.reloadData()
        }
    }


}

