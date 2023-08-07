//
//  WebAPIResponseBuilder.swift
//  SwiftUI99
//
//  Created by Omnimobile on 8/1/23.
//

import Foundation

struct WebAPIResponseBuilder<T: AnyObject> {
    var result = WebAPIResponse<T>(responseData: nil, responseCode: 0)
    
    mutating func setData(data: T) -> WebAPIResponseBuilder<T> {
        result.responseData = data
        return self
    }
    
    mutating func setResponseCode(code: Int) -> WebAPIResponseBuilder<T> {
        result.responseCode = code
        return self
    }
    
    func build() -> WebAPIResponse<T> {
        return result
    }
}
