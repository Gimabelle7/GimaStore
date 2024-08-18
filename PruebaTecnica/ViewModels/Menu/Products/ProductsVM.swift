//
//  ProductsVM.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 13/8/24.
//

import Foundation
import UIKit

class ProductsVM {
    let productServices = ProductServiceFr()
    let vc: UIViewController
    init(vc_: UIViewController) {
        vc = vc_
    }
    private(set) var filteredProducts: [Products] = [] {
        didSet {
            onDataUpdate?()
        }
    }
     var itemsProducts: [Products] = [] {
         didSet {
             onDataUpdate?()
         }
     }
    
    var onDataUpdate: (() -> Void)?
 
    var itemsCategories: [String] = [] {
        didSet {
            onDataUpdateCategories?()
        }
    }
    

    var onDataUpdateCategories: (() -> Void)?
    
    func filterProduct(by searchText: String) {
        let lowercasedSearchText = searchText.lowercased()
        if searchText.isEmpty {
            filteredProducts = itemsProducts
        } else {
            filteredProducts = itemsProducts.filter { product in
                let title = product.title ?? ""
                let category = product.category ?? ""
                let price = product.price ?? 0.0
                let matchesTitle = title.lowercased().contains(lowercasedSearchText)
                let matchesCategory = category.lowercased().contains(lowercasedSearchText)
                let matchesPrice = "\(price)".contains(lowercasedSearchText)
                
                return matchesTitle || matchesCategory || matchesPrice
            }
        }
        onDataUpdate?()
    }
    
    func fetchCategories (){
        ApiServices.shared.request(url: ApiConstant.categories,method: .get) { (result:Result<[String],Error>) in
            switch result{
            case .success(let categories):
                var cat_ = categories
                cat_.insert("Todos", at: 0)
                self.itemsCategories = cat_
            case .failure(let error):
                print("error: \(error)")
            }
        }
    }
    
    func fetchProducts (categories:String = ""){
        vc.showLoad()
        let params = categories.isEmpty ? "" : "/category/\(categories)"
        ApiServices.shared.request(url: ApiConstant.products + params,method: .get) { (result:Result<[Products],Error>) in
            self.vc.hideLoad()
            switch result{
            case .success(let products):
                if categories.isEmpty{
                    self.productServices.fetchProducts(vc:self.vc) { pro_, success in
                        let arrayFinal = pro_ + products
                        self.itemsProducts = arrayFinal
                        self.filteredProducts =  self.itemsProducts
                    }
                   return
                }
                self.productServices.filterProduct(vc:self.vc,category: categories) { pro_, success in
             
                    let arrayFinal = pro_ + products
                    self.itemsProducts = arrayFinal
                    self.filteredProducts =  self.itemsProducts
                }
            case .failure(let error):
                print("error: \(error)")
            }
        }
    }
}
