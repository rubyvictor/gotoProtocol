//
//  RandomUser.swift
//  GoingProto
//
//  Created by Victor Lee on 7/5/19.
//  Copyright © 2019 VictorLee. All rights reserved.
//

import Foundation

struct RandomUser: Decodable, UserProtocol {
    
    let nameObject: Name
    let DOBObject: DOB
    
    var name: String {
        return nameObject.first + " " + nameObject.last
    }
    
    var randomFact: String {
        return "I'm " + String(DOBObject.age) + " years old"
    }
    
    private enum CodingKeys: String, CodingKey {
        case nameObject = "name"
        case DOBObject = "dob"
    }
}

extension RandomUser {
    
    struct Name: Decodable {
        let first: String
        let last: String
    }
    
    struct DOB: Decodable {
        let age: Int
    }
}
