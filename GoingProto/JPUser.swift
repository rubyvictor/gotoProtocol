//
//  Users.swift
//  GoingProto
//
//  Created by Victor Lee on 7/5/19.
//  Copyright © 2019 VictorLee. All rights reserved.
//

import Foundation

struct JPUser: Decodable, UserProtocol {
    
    let name: String
    let website: String
    
    
    var randomFact: String {
        return website
    }
    
}
