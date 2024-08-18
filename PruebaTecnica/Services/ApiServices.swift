//
//  ApiServices.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 12/8/24.
//

import Foundation
import Alamofire

class ApiServices{
    
    static let shared = ApiServices()
    private init() {}
    
    /// Funcion global que consulta apis dinamicas
    /// - Parameters:
    ///   - url: url del api
    ///   - method: metodo POST | PUT | DELETE | UPDATE
    ///   - parameters: parametros json
    ///   - headers: autorizaciones
    ///   - completion: devuelve respuesta de la consulta
    func request<T: Decodable>(url: String, method: HTTPMethod = .post, parameters: [String: Any]? = nil, headers: HTTPHeaders? = nil, completion: @escaping (Result<T, Error>) -> Void) {
      if  NetworkSense.shared.isConnectedToInternet(){
            AF.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }else{
            print("Internet connection is unAvailable.")
        }

    }
}
