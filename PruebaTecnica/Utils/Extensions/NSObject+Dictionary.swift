//
//  NSObject+Dictionary.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 9/8/24.

import Foundation

func toJSON(_ objeto: Any) -> [String: Any] {
    let mirror = Mirror(reflecting: objeto)
    var dict = [String: Any]()

    for case let (label?, value) in mirror.children {
        dict[label] = value
    }

    return dict
}

func decodeObject<T: Decodable>(
        _ data: Any,
        tipo: T.Type,
        convertirData: (Any) throws -> Data
    ) -> T? {
        do {
            let jsonData = try convertirData(data)
            let objeto = try JSONDecoder().decode(T.self, from: jsonData)
            return objeto
        } catch {
            print("Error al decodificar datos: \(error.localizedDescription)")
            return nil
        }
}
