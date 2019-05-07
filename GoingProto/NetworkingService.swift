//
//  NetworkingService.swift
//  GoingProto
//
//  Created by Victor Lee on 7/5/19.
//  Copyright © 2019 VictorLee. All rights reserved.
//

import Foundation

class NetworkingService {
    
    public func makeRequest(to endpoint: Endpoint, completion: @escaping (Result<[User],Error>)-> Void) {
        
        guard let url = URL(string: endpoint.rawValue) else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            if let unwrappedError = err {
                completion(.failure(unwrappedError))
                print("unwrapped error: \(unwrappedError)")
            } else if let unwrappedData = data {
                do {
                    guard let json = try? JSONDecoder().decode([User].self, from: unwrappedData) else { return () }
                    completion(.success(json))
                    print("Users json:\(json)")
                } catch let jsonError {
                    completion(.failure(jsonError))
                }
            }
        }
        
        dataTask.resume()
        
    }
    
    enum Endpoint: String {
        case jsonPlaceholder = "https://jsonplaceholder.typicode.com/users"
    }
    
    
}
