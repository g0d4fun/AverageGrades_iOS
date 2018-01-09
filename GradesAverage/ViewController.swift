//
//  ViewController.swift
//  GradesAverage
//
//  Created by Rafael Filipe Carreira Henriques on 23/12/2017.
//  Copyright © 2017 Rafael Filipe Carreira Henriques. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let ects = [[6,5,5,5,5,4],
                [6,4,5,5,5,5],
                [5,5,5,5,5,5],
                [5,5,5,5,5,5],
                [6,6,6,6,6],
                [3,27]]
    
    @IBOutlet weak var UIAverageGrade: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }

    override func viewDidAppear(_ animated: Bool) {
        
        let defaults = UserDefaults.standard
        
        if(defaults.object(forKey: "SavedGrades") == nil){
            UIAverageGrade?.text = ""
        }else{
            let grades = defaults.array(forKey: "SavedGrades")  as? [[Int]] ?? [[Int]]()
            var sum = 0
            var ectsSum = 0;
            
            for section in 0 ..< ects.count {
                for x in 0 ..< ects[section].count {
                    let grade = grades[section][x]
                    let ectsAux = ects[section][x]
                    if(grade >= 10 && grade <= 20){
                        sum += ectsAux * grade
                        ectsSum += ectsAux;
                    }
                }
            }
            if(ectsSum == 0){
                UIAverageGrade?.text = ""
                return;
            }
            UIAverageGrade?.text = (sum / ectsSum).description;
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }


}

