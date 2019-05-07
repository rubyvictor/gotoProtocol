//
//  DummyApiResponse.swift
//  GoingProto
//
//  Created by Victor Lee on 7/5/19.
//  Copyright © 2019 VictorLee. All rights reserved.
//

import Foundation

struct DummyApiResponse: HasUsers {
    var users: [UserProtocol]
    
    init(from decoder: Decoder) throws {
        self.users = try [DummyUser].init(from: decoder)
    }
}
