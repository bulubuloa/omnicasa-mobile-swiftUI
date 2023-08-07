//
//  IAuthenticationService.swift
//  SwiftUI99
//
//  Created by Omnimobile on 8/1/23.
//

import Foundation

protocol IAuthenticationService {
    func tokenAlive() -> Bool
    func oauthTokenExpired(completion: @escaping(Result<Bool, Error>) -> Void)
}
