//
//  RandomApiResponse.swift
//  GoingProto
//
//  Created by Victor Lee on 7/5/19.
//  Copyright © 2019 VictorLee. All rights reserved.
//

import Foundation

struct RandomApiResponse: HasUsers {
    var users: [UserProtocol]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.users = try container.decode([RandomUser].self, forKey: .results)
    }
    
    private enum CodingKeys: String, CodingKey {
        case results = "results"
    }
    
}
