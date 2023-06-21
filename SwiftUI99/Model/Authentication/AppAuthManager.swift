//
//  AppAuthManager.swift
//  SwiftUI99
//
//  Created by Omnimobile on 6/20/23.
//

import Foundation
import AppAuthCore
import UIKit
import AppAuth

class AppAuthManager: IAppAuthManager {
    private var currentOAuthSession: OIDExternalUserAgentSession?
    
    private var loginContinuation: CheckedContinuation<Bool, Error>?
    
    private var settingDataStore: ISettingDataStore?
    
    init() {
        settingDataStore = SettingDataStore()
    }

    func startLogin() {
        let currentViewController = getHostingViewController()
        Task {
            do {
                let resultRequest = try await startLoginRequest(uiViewController: currentViewController)
                
                if resultRequest != nil {
                    getOAuthToken(authResponse: resultRequest!)
                }
            } catch {
                
            }
        }
    }
    
    func onLoginFinished() async throws -> Bool {
        try await withCheckedThrowingContinuation { continuation in
            loginContinuation = continuation
        }
    }
    
    private func startLoginRequest(uiViewController:  UIViewController) async throws -> OIDAuthorizationResponse? {
        try await withCheckedContinuation { continuation in
            let request = buildRequest()
            let userAgent = OIDExternalUserAgentIOS(presenting: uiViewController)
            currentOAuthSession = OIDAuthorizationService.present(request, externalUserAgent: userAgent!) { authResponse, error in
                continuation.resume(returning: authResponse)
            }
        }
    }
    
    private func getOAuthToken(authResponse: OIDAuthorizationResponse) -> Void {
        let extraParams = [String: String]()
        let request = authResponse.tokenExchangeRequest(withAdditionalParameters: extraParams)
        OIDAuthorizationService.perform(request!, originalAuthorizationResponse: authResponse, callback: tokenResponseCallback)
    }
    
    func tokenResponseCallback(response: OIDTokenResponse?, error: Error?) {
        if let res = response {
            print("\(String(describing: res.accessToken))")
            settingDataStore?.saveSetting(keyName: SettingKeys.oauthToken.rawValue, keyValue: res.accessToken)
            settingDataStore?.saveSetting(keyName: SettingKeys.refreshToken.rawValue, keyValue: res.refreshToken)
            loginContinuation?.resume(returning: true)
        } else {
            loginContinuation?.resume(throwing: error!)
        }
    }
    
    private func getHostingViewController() -> UIViewController {
        let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        return scene!.keyWindow!.rootViewController!
    }
    
    private func buildConfig() -> OIDServiceConfiguration {
        return OIDServiceConfiguration(
            authorizationEndpoint: URL(string: OAuthConfig.endPoint)!,
            tokenEndpoint: URL(string: OAuthConfig.tokenEndPoint)!)
    }
    
    private func buildRequest() -> OIDAuthorizationRequest {
        let config = buildConfig()
        
        var extraParams = [String: String]()
        extraParams["acr_values"] = "target:v2"
        
        return OIDAuthorizationRequest(
            configuration: config,
            clientId: OAuthConfig.clientID,
            clientSecret: OAuthConfig.clientSecret,
            scopes: OAuthConfig.scope,
            redirectURL: URL(string: OAuthConfig.redirectUri)!,
            responseType: OIDResponseTypeCode,
            additionalParameters: extraParams
        )
    }
}
