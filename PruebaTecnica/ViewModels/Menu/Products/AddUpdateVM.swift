//
//  AddUpdateVM.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 16/8/24.
//

import Foundation
import UIKit

class AddUpdateVM{

    let producServiceFR = ProductServiceFr()
    let vc: UIViewController
    init(vc_: UIViewController) {
        vc = vc_
    }
    
    func validateForm(product: Products?) ->Bool {
        guard let title_ = product?.title?.trimmingCharacters(in: .whitespacesAndNewlines), !title_.isEmpty else {
            AlertHelper.show(titulo: "Error", mensaje: "El campo de Titulo está vacío.", en: vc)
            return false
        }
        var price :String?
        price = "\(product?.price ?? 0.0)"
        guard let price_ = price?.trimmingCharacters(in: .whitespacesAndNewlines), !price_.isEmpty else {
            AlertHelper.show(titulo: "Error", mensaje: "El campo de Precio está vacío.", en: vc)
            return false
        }
        
        guard let url_ = product?.image?.trimmingCharacters(in: .whitespacesAndNewlines), !url_.isEmpty else {
            AlertHelper.show(titulo: "Error", mensaje: "El campo de Url está vacío.", en: vc)
            return false
        }
        
        guard let category_ = product?.category?.trimmingCharacters(in: .whitespacesAndNewlines), !category_.isEmpty else {
            if product?.category ?? "" == "Seleccione una categoría"{
                AlertHelper.show(titulo: "Error", mensaje: "Por favor, seleccione una categoría.", en: vc)
                return false
            }
            AlertHelper.show(titulo: "Error", mensaje: "El campo de Número de teléfono está vacío.", en: vc)
            return false
        }
        
        guard let desc_ = product?.description?.trimmingCharacters(in: .whitespacesAndNewlines), !desc_.isEmpty else {
            AlertHelper.show(titulo: "Error", mensaje: "El campo de descripción está vacío.", en: vc)
            return false
        }
        return true
    }
    
    func createProduct(product:Products?, completion: @escaping (Products?, Bool) -> Void){
        let payload = product?.toDictionary()
        ApiServices.shared.request(url: ApiConstant.products,method: .post,parameters: payload) { (result:Result<Products,Error>) in
            switch result{
            case .success(let product_):

                self.producServiceFR.createProduct(product: product, vc: self.vc) { success in
                    completion(product_,success ?? false)
                }
               
            case .failure(let error):

                AlertHelper.show(titulo: "Error", mensaje: "Ocurrió un error al crear el registro.", en: self.vc)
                completion(nil,false)
              
            }
        }
    }
    
    func updateProduct(product:Products?, completion: @escaping (Products?, Bool) -> Void){
        let provider = product?.proveedorDB ?? ""
        if provider == FireConstant.provider{
            self.producServiceFR.updateProduct(product: product!, vc: self.vc) { prod, success in
                completion(product,true)
            }
            return
        }
        let payload = product?.toDictionary()
        ApiServices.shared.request(url: "\(ApiConstant.products)/\(product?.id ?? 0)",method: .put,parameters: payload) { (result:Result<Products,Error>) in
            switch result{
            case .success(_):
                completion(product,true)
            case .failure(let error):

                AlertHelper.show(titulo: "Error", mensaje: "Ocurrió un error al crear el registro.", en: self.vc)
                completion(nil,false)
              
            }
        }
    }
    
    func deleteProduct(product:Products?, completion: @escaping (Products?, Bool) -> Void){
        ApiServices.shared.request(url: "\(ApiConstant.products)/\(product?.id ?? 0)",method: .delete) { (result:Result<Products,Error>) in
            switch result{
            case .success(let product_):

                completion(nil,true)
            case .failure(let error):

                AlertHelper.show(titulo: "Error", mensaje: "Ocurrió un error al crear el registro.", en: self.vc)
                completion(nil,false)
              
            }
        }
    }
}
