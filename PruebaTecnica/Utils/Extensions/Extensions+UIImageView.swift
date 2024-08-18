//
//  Extensions+UIImageView.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 14/8/24.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(from url: URL, placeholder: UIImage? = nil, completion: ((UIImage?) -> Void)? = nil) {
        // Asignar una imagen de placeholder mientras se carga la imagen desde la URL
        self.image = placeholder
        
        // Crear una tarea para descargar la imagen de la URL
        URLSession.shared.dataTask(with: url) { data, response, error in
            // Verificar si hubo un error
            if let error = error {
                print("Error loading image: \(error)")
                completion?(nil)
                return
            }
            
            // Verificar que se haya recibido data válida
            guard let data = data, let image = UIImage(data: data) else {
                print("No valid image data received")
                completion?(nil)
                return
            }
            
            // Actualizar la imagen en el hilo principal
            DispatchQueue.main.async {
                self.image = image
                completion?(image)
            }
        }.resume()
    }
}
