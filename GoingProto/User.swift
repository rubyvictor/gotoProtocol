//
//  Users.swift
//  GoingProto
//
//  Created by Victor Lee on 7/5/19.
//  Copyright © 2019 VictorLee. All rights reserved.
//

import Foundation

struct User: Decodable, UserProtocol {
    
    let name: String
    
    var randomFact: String {
        return "I'm a random person called \(name)"
    }
    
}
