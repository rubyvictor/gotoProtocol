//
//  HasUser.swift
//  GoingProto
//
//  Created by Victor Lee on 7/5/19.
//  Copyright © 2019 VictorLee. All rights reserved.
//

import Foundation

protocol HasUsers: Decodable {
    var users: [UserProtocol] { get }
}
