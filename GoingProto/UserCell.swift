//
//  UserCell.swift
//  GoingProto
//
//  Created by Victor Lee on 7/5/19.
//  Copyright © 2019 VictorLee. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
//    var user: User? {
//        didSet {
//            guard let name = user?.name else { return }
//            nameLabel.text = name
//        }
//    }
    
    func populate(with user: User) {
        nameLabel.text = user.name
    }
}
