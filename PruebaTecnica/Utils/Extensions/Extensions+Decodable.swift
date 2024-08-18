//
//  Extensions+Decodable.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 14/8/24.
//

import Foundation


extension Encodable {
    
    func toDictionary() -> [String: Any] {
        let mirror = Mirror(reflecting: self)
        var dict: [String: Any] = [:]
        
        for child in mirror.children {
            if let key = child.label {
                if let value = child.value as? OptionalProtocol {
                    if !value.isNil {
                        dict[key] = value.unwrap()
                    }
                } else {
                    dict[key] = child.value
                }
            }
        }
        
        return dict
    }
    
    

    
}

protocol OptionalProtocol {
    var isNil: Bool { get }
    func unwrap() -> Any
}

extension Optional: OptionalProtocol {
    var isNil: Bool {
        return self == nil
    }
    
    func unwrap() -> Any {
        switch self {
        case .some(let value):
            return value
        case .none:
            fatalError("Tried to unwrap nil Optional")
        }
    }
}
