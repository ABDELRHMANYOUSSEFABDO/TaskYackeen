//
//  NetworkClient.swift
//  PizzaWorld
//
//  Created by Apple on 12/24/21..
//

import Foundation


class NetworkClient {
    let mainURL = "http://api.tvmaze.com/search/shows?q=Future"
    func performRequest<T: Decodable>(_ object: T.Type, completion: @escaping ((Result<T, Error>) -> Void)) {
        URLSession.shared.dataTask(with: URL(string: mainURL)!) { (data, response, error)
            in
            if error == nil {
                if let data = data {
                    do {
                        let userResponse = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(userResponse))
                        
                    }catch let error {
                        completion(.failure(error))
                        print(error.localizedDescription)
                    }
                }
            } else {
                print(error?.localizedDescription as Any)
            }
            
        }.resume()
    }
    
}
