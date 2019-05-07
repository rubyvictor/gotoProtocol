//
//  DummyUser.swift
//  GoingProto
//
//  Created by Victor Lee on 7/5/19.
//  Copyright © 2019 VictorLee. All rights reserved.
//

import Foundation

struct DummyUser: Decodable, UserProtocol {
    
    let name: String
    let salary: String
    
    var randomFact: String {
        return "I make \(salary) in salary per year."
    }
        
    
    private enum CodingKeys: String, CodingKey {
        case name = "employee_name"
        case salary = "employee_salary"
    }
}
