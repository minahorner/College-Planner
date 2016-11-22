//
//  arrayTransfer.swift
//  CollegePlanner
//
//  Created by student3 on 11/22/16.
//  Copyright © 2016 John Hersey High School. All rights reserved.
//

import UIKit

class arrayTransfer {

    var allColleges : [College] = []
    var appliedColleges : [College] = []
    var acceptedColleges : [College] = []
    var applyingColleges : [College] = []
    var consideringColleges : [College] = []
    
    init(allColleges : [College], appliedColleges: [College], acceptedColleges : [College], applyingColleges : [College],consideringColleges : [College]) {
        self.allColleges = allColleges
        self.appliedColleges = appliedColleges
        self.acceptedColleges = acceptedColleges
        self.consideringColleges = consideringColleges
        self.applyingColleges = applyingColleges
    }
}
