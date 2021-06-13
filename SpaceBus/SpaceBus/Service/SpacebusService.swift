//
//  SpacebusService.swift
//  SpaceBus
//
//  Created by Ebubekir Sezer on 13.06.2021.
//

import Foundation
import Alamofire

enum SpacebusError: Error {
    case parseError
    case badURLError
    case badRequestError
}

final class SpacebusService {
    
    public static let shared = SpacebusService()
    
    public func fetchSpaceships(completion: @escaping(Result<[Spaceship], SpacebusError>) -> Void) {
        
        do {
            if let url = URL(string: Constants.baseURL) {
                var urlRequest = URLRequest(url: url)
                urlRequest.httpMethod = "GET"
                
                AF.request(urlRequest).validate().responseJSON { response in
                    switch response.result {
                    case .success(let result):
                        do {
                            //JSON
                            if let resultValue = result as? [String: Any] {
                                let jsonData = try JSONSerialization.data(withJSONObject: resultValue, options: .prettyPrinted)
                                let jsonResults = try JSONDecoder().decode([Spaceship].self, from: jsonData)
                                completion(.success(jsonResults))
                            }
                            
                            // Array of JSON
                            if let resultValue = result as? [[String: Any]] {
                                let jsonData = try JSONSerialization.data(withJSONObject: resultValue, options: .prettyPrinted)
                                let jsonResults = try JSONDecoder().decode([Spaceship].self, from: jsonData)
                                completion(.success(jsonResults))
                            }
                        } catch {
                            completion(.failure(.parseError))
                        }
                        
                    case .failure(let error):
                        print(error.localizedDescription)
                        completion(.failure(.badRequestError))
                    }
                }
            }
        } catch {
            completion(.failure(.badURLError))
        }
    }
}
