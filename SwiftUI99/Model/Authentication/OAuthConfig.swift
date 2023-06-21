//
//  OAuthConfig.swift
//  SwiftUI99
//
//  Created by Omnimobile on 6/20/23.
//

import Foundation

struct OAuthConfig {
    static let endPoint = "https://oauth2.omnicasa.com/oauth2/auth"
    
    static let tokenEndPoint = "https://oauth2.omnicasa.com/oauth2/token"
    
    static let server = "https://oauth2.omnicasa.com/"
    
    static let redirectUri = "omnicasa://auth/oauth2/callback"
    
    static let clientID = "mobile-consumer"
    
    static let clientSecret = "Fg5uofqWhNOG2P1T7JC0uZlspsiviEeJ"
    
    static let scope = ["openid", "offline", "profile", "email"]
}
