//
//  ConnectionManager.swift
//  SwapiPlanets
//
//  Created by Atul Prakash on 24/05/23.
//

import Foundation

class ConnectionManager {
    static let shared = ConnectionManager()
    private init () {}

    var hasConnectivity: Bool {
        get {
            do {
                let reachability: Reachability = try Reachability()
                let networkStatus = reachability.connection
                
                switch networkStatus {
                case .unavailable:
                    return false
                case .wifi, .cellular:
                    return true
                }
            }
            catch {
                return false
            }
        }
        set {
            
        }
    }
}
