//
//  WebAPIResponse.swift
//  SwiftUI99
//
//  Created by Omnimobile on 8/1/23.
//

import Foundation

struct WebAPIResponse<T: AnyObject> {
    var responseData: T?
    var responseCode: Int
}
