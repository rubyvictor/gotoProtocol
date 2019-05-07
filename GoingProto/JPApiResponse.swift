//
//  JPApiResponse.swift
//  GoingProto
//
//  Created by Victor Lee on 7/5/19.
//  Copyright © 2019 VictorLee. All rights reserved.
//

import Foundation

struct JPApiResponse: HasUsers {
    var users: [UserProtocol]
    
    init(from decoder: Decoder) throws {
        self.users = try [JPUser].init(from: decoder)
    }
}
