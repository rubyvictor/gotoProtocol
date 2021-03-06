//
//  NetworkingService.swift
//  GoingProto
//
//  Created by Victor Lee on 7/5/19.
//  Copyright © 2019 VictorLee. All rights reserved.
//

import Foundation

class NetworkingService {
    
    public func makeRequest<Type: Decodable>(to endpoint: Endpoint, completion: @escaping (Result<Type,Error>)-> Void) {
        
        guard let url = URL(string: endpoint.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            if let unwrappedError = err {
                completion(.failure(unwrappedError))
                print("unwrapped error: \(unwrappedError)")
            } else if let unwrappedData = data {
                do {
                    guard let decodedObject = try? JSONDecoder().decode(Type.self, from: unwrappedData) else { return }
                    DispatchQueue.main.async {
                        completion(.success(decodedObject))
                    }
                } catch let jsonError {
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
    
    public func getUsers<T: HasUsers>(from endpoint: Endpoint, completion: @escaping (Result<T, Error>)->Void) {
        makeRequest(to: endpoint, completion: completion)
    }
    
    
    enum Endpoint: String {
        case jsonPlaceholder = "https://jsonplaceholder.typicode.com/users"
        case randomUser = "https://randomuser.me/api/?page=1&results=10&seed=abc"
        case dummyRestApi = "http://dummy.restapiexample.com/api/v1/employees"
    }
    
    
}
