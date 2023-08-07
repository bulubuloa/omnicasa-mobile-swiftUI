//
//  AuthenticationService.swift
//  SwiftUI99
//
//  Created by Omnimobile on 8/1/23.
//

import Foundation

class AuthenticationService : IAuthenticationService {
    
    let webapiConnector = WebAPIConnector()
    
    func tokenAlive() -> Bool {
        return true
    }
    
    func oauthTokenExpired(completion: @escaping(Result<Bool, Error>) -> Void) {
        let url = "https://webapinew-staging.omnicasa.com/13496.2.0/users/configs"
        URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                let statusCode = httpResponse.statusCode
                print("HTTP Response Code: \(statusCode)")
                        
                // You can handle different status codes here
                if statusCode == 401 {
                    // Do something for success
                    print("Token expired")
                    completion(.success(true))
                } else {
                    // Handle other status codes
                    print("Token still alive")
                    completion(.success(false))
                }
                return
            }
            
            completion(.failure(NSError()))
        }.resume()
    }
}
