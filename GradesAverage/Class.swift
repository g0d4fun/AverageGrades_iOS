//
//  Class.swift
//  GradesAverage
//
//  Created by Rafael Filipe Carreira Henriques on 03/01/2018.
//  Copyright © 2018 Rafael Filipe Carreira Henriques. All rights reserved.
//

import Foundation


class Class{
    var id: Int
    var name : String
    var ects : Int
    var year : Int
    var semester : Int
    var average : Int?
    
    
    init(id : Int, name : String, ects : Int, year : Int, semester : Int ){
        self.id = id
        self.name = name
        self.ects = ects
        self.year = year
        self.semester = semester
    }
    
    
    
}
