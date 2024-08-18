//
//  MonitorSense.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 8/8/24.

import Foundation
import Network
import Alamofire

class NetworkSense {
    static let shared = NetworkSense()
    
    private init() {}
    
    func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
    
}
