//
//  ProductServiceFr.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 16/8/24.
//

import Foundation
import FirebaseFirestore

class ProductServiceFr{
    private let db = Firestore.firestore()
    
    func createProduct(product: Products?,vc: UIViewController, completion: @escaping (Bool?) -> Void) {
        if let user_:Users = GlobalStorage.shared.get(forKey: StorageConstant.userData, as: Users.self) {
            let documentID = UUID().uuidString
            var product_ = product
            product_?.UID = user_.uid ?? ""
            product_?.idProduct = documentID
            product_?.proveedorDB = FireConstant.provider
            product_?.create =   "\(DateHelper.getCurrentDateString())"
            product_?.like = false
            let payload = product_?.toDictionary()

            db.collection(FireConstant.productsColl).document(documentID).setData(payload!) { error in
                if let error = error {
                    let msg = UserValidations.errorFirestoreMsg(errors: error)
                    AlertHelper.show(titulo: "Error", mensaje: msg, en: vc)
                   return
                }
                completion(true)
            }
            return
        }
        AlertHelper.show(titulo: "Error", mensaje: "Usuario no autenticado", en: vc)
    }
    
    func updateProduct(product:Products ,vc: UIViewController, completion: @escaping (Products, Bool) -> Void){
            let idProduct = product.idProduct ?? ""
            let productRef = db.collection(FireConstant.productsColl).document(idProduct)
            var product_ = product
            product_.updated =  "\(DateHelper.getCurrentDateString())"
            let payload = product_.toDictionary()

            productRef.updateData(payload) { error in
                if let error = error {
                    let msg = UserValidations.errorFirestoreMsg(errors: error)
                    AlertHelper.show(titulo: "Error", mensaje: msg, en: vc)
                    completion(Products(),false)
                   return
                }
                    completion(product,true)
            }
    }
    
    
    
    func filterProduct(vc: UIViewController,category:String, completion: @escaping ([Products], Bool) -> Void){
        db.collection(FireConstant.productsColl)
                .whereField("category", isEqualTo: category)
                .getDocuments { (querySnapshot, error) in
                    if let error = error {
                        let msg = UserValidations.errorFirestoreMsg(errors: error)
                        AlertHelper.show(titulo: "Error", mensaje: msg, en: vc)
                        completion([],true)
                        return
                    }
                    
                    guard let documents = querySnapshot?.documents else {
                        let msg = "Error al obtener los datos."
                        AlertHelper.show(titulo: "Error", mensaje: msg, en: vc)
                        completion([],true)
                        return
                    }
                    
                    let products: [Products] = documents.compactMap { document in
                        do {
                            let product = try document.data(as: Products.self)
                            return product
                        } catch {
                            let msg = "Error al obtener los datos."
                            AlertHelper.show(titulo: "Error", mensaje: msg, en: vc)
                            completion([],true)
                            return nil
                        }
                    }
                    
                    completion(products,false)
                }
        
    }
    
    func fetchProducts(vc: UIViewController, completion: @escaping ([Products], Bool) -> Void) {
        db.collection(FireConstant.productsColl).getDocuments { (querySnapshot, error) in
                  if let error = error {
                      let msg = UserValidations.errorFirestoreMsg(errors: error)
                      AlertHelper.show(titulo: "Error", mensaje: msg, en: vc)
                      completion([],true)
                      return
                  }
                  
                  guard let documents = querySnapshot?.documents else {
                      let msg = "Error al obtener los datos."
                      AlertHelper.show(titulo: "Error", mensaje: msg, en: vc)
                      completion([],true)
                      return
                  }
                  
                  let products: [Products] = documents.compactMap { document in
                      do {
                          let product = try document.data(as: Products.self)
                          return product
                      } catch {
                          let msg = "Error al obtener los datos."
                          AlertHelper.show(titulo: "Error", mensaje: msg, en: vc)
                          completion([],true)
                          return nil
                      }
                  }
                  completion(products,false)
        }
    }
    
    func deleteProductById(vc: UIViewController,documentId: String, completion: @escaping (Bool) -> Void) {
        let db = Firestore.firestore()
        let documentRef = db.collection(FireConstant.productsColl).document(documentId)
        documentRef.delete { error in
            if let error = error {
                let msg = UserValidations.errorFirestoreMsg(errors: error)
                AlertHelper.show(titulo: "Error", mensaje: msg, en: vc)
                completion(false)
            } else {
                completion(true)
            }
        }
    }
}
