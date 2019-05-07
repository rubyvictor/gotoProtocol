//
//  UsersTableViewController.swift
//  GoingProto
//
//  Created by Victor Lee on 7/5/19.
//  Copyright © 2019 VictorLee. All rights reserved.
//

import UIKit

class UsersTableViewController: UITableViewController {
    
    var users = [User]()
    let networkCall = NetworkingService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUsers()
    }
    
    private func getUsers() {
        networkCall.makeRequest(to: .jsonPlaceholder) { (result) in
            switch result {
            case .success(let users):
                self.users = users
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("Error fetching user:\(error)")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell else { return UITableViewCell() }
        
        let user = users[indexPath.row]
//        cell.nameLabel.text = user.name
        
        cell.populate(with: user)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        performSegue(withIdentifier: "segue", sender: user)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsVC = segue.destination as? DetailsViewController,
            
            let user = sender as? User
            else { return }
        
        detailsVC.user = user
    }
}
