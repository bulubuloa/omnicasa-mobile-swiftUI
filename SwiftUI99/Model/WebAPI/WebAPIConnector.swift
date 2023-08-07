//
//  WebAPIConnector.swift
//  SwiftUI99
//
//  Created by Omnimobile on 8/1/23.
//

import Foundation

class WebAPIConnector {
    let settingDataStore: ISettingDataStore = SettingDataStore()
    
    func getResponse<T: AnyObject>(urlEndpoint: String) -> WebAPIResponse<T> {
        var result = WebAPIResponseBuilder<T>()
        guard let url = URL(string: urlEndpoint) else {
            return result.build()
        }
        
        let taskGet = URLSession.shared.dataTask(with: url) {
            data, response, error in
            if let error = error {
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                return
            }
            
            result.setResponseCode(code: httpResponse.statusCode)
        }
        
        taskGet.resume()
        return result.build()
    }
    
    func getResponse2<T: AnyObject>(urlEndPoint: String, completion: @escaping (Result<WebAPIResponse<T>, Error>) -> Void) {
        guard let url = URL(string: urlEndPoint) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(NSError(domain: "Invalid request", code: 1)))
                return
            }
            
            var result = WebAPIResponseBuilder<T>()
            result.setResponseCode(code: httpResponse.statusCode)
            completion(.success(result.build()))
        }
        
        task.resume()
    }
}
