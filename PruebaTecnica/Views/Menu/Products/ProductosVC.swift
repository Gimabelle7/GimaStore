//
//  ProductosVC.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 11/8/24.
//

import UIKit

class ProductosVC: UIViewController,UITextFieldDelegate{
    
    var productVM:ProductsVM!
    
    @IBOutlet weak var lblCategories: UILabel!
    @IBOutlet weak var categoriesCV: UICollectionView!
    @IBOutlet weak var productsCV: UICollectionView!
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var viewSearch: UIView!
    
    private var selectedCategoryIndex: IndexPath?
    
    let CVC_CATEGORIES = 1
    let CVC_PRODUCTS = 2
    let viewColorViewers = #colorLiteral(red: 0.8304866552, green: 0.8354588747, blue: 0.8439782262, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productVM = ProductsVM(vc_: self)
        setupSearch()
        setupCollect()
        setupCollectionView()
        productVM.fetchCategories()
        productVM.fetchProducts()

        retrieveData()
    }
    
    func setupSearch(){
        txtSearch.delegate = self
        viewSearch.applyCorner(cornerRadius: 17,background: viewColorViewers.withAlphaComponent(0.4),shadowColor: .clear)
    }
    
    func setupCollect() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = .zero
        layout.minimumLineSpacing = 0 //as per your requirement
        layout.minimumInteritemSpacing = 0 //as per your requirement
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (self.productsCV.frame.width / 2) - 50, height: 220)
        self.productsCV.collectionViewLayout = layout
    }

    private func setupCollectionView() {
        categoriesCV.dataSource = self
        categoriesCV.delegate = self
       /* categoriesCV.register(CategoriesCVC.self, forCellWithReuseIdentifier: "CellCategories")*/
    }
    
    private func retrieveData() {
        productVM.onDataUpdateCategories = { [weak self] in
            self?.selectedCategoryIndex = IndexPath(item: 0, section: 0)
            self?.categoriesCV.reloadData()
        }
        
        productVM.onDataUpdate = { [weak self] in
            self?.productsCV.reloadData()
            self?.productsCV.layoutIfNeeded()
        }
    }
    
    
    @IBAction func pressAddProduct(_ sender: UIBarButtonItem) {
        NavigationHelper.presentScreen(on: self, withIdentifier: IdVcConstant.addUpdateProduct,data: ItemConfig( categories: productVM.itemsCategories))
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: string)

        productVM.filterProduct(by: updatedText)
        productsCV.reloadData()
        return true
    }
    
}


// MARK: - UICollectionViewDataSource

extension ProductosVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == CVC_CATEGORIES {
            return productVM.itemsCategories.count
        }
        if collectionView.tag == CVC_PRODUCTS{
            return productVM.filteredProducts.count
        }
     return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == CVC_CATEGORIES {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellCategories", for: indexPath) as? CategoriesCVC else {
                      fatalError("Unexpected cell type")
                  }
            let item = productVM.itemsCategories[indexPath.item]

            let isSelected = selectedCategoryIndex == indexPath
            cell.configure(with: item,isSelected: isSelected)
            return cell
        }
        if collectionView.tag == CVC_PRODUCTS {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellProducts", for: indexPath) as? ProductsCVC else {
                      fatalError("Unexpected cell type")
                  }
            let item = productVM.filteredProducts[indexPath.item]

            cell.configure(with: item,isSelected: false)
            return cell
        }
        return UICollectionViewCell()
    }

}

// MARK: - UICollectionViewDelegate

extension ProductosVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == CVC_CATEGORIES {
            let selectedItem = productVM.itemsCategories[indexPath.item]
            // Manejar la selección del ítem aquí
            selectedCategoryIndex = indexPath
            productVM.itemsProducts.removeAll()
            let url = selectedItem == "Todos" ? "" : selectedItem
            productVM.fetchProducts(categories:url)
            collectionView.reloadData()
        }
        if collectionView.tag == CVC_PRODUCTS {
            let selectedItem = productVM.filteredProducts[indexPath.item]
            collectionView.reloadData()
            
            let itemConfig = ItemConfig(product: selectedItem, categories: productVM.itemsCategories)

            NavigationHelper.presentScreen(on: self, withIdentifier: IdVcConstant.detailProduct,data: itemConfig)
            
        }

    }
}

extension ProductosVC: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == CVC_CATEGORIES {
            let category = productVM.itemsCategories[indexPath.item]
            let font = UIFont.systemFont(ofSize: 16)
            let width = category.width(withConstrainedHeight: 50, font: font) + 40 // 20 is for padding
            return CGSize(width: width, height: 35)
        }
        if collectionView.tag == CVC_PRODUCTS {
          
            return CGSize(width: (self.productsCV.frame.width / 2) - 4, height: 259)
        }
        return CGSize()
    }
}
