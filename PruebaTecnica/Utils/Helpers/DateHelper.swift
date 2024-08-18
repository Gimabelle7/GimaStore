//
//  DateHelper.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 13/8/24.
//

import Foundation

class DateHelper {

    // Método para obtener la fecha actual como String
    static func getCurrentDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" // Puedes ajustar el formato según sea necesario
        return dateFormatter.string(from: Date())
    }

    // Puedes agregar otros métodos relacionados con la gestión de fechas aquí
}
