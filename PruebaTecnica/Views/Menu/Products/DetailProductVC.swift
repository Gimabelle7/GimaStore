//
//  DetailProductVC.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 15/8/24.
//

import UIKit

class DetailProductVC: UIViewController , DataReceiver {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var imProduct: UIImageView!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var viewViewers: UIView!
    @IBOutlet weak var lblViewers: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var viewPrice: UIView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var btnAddCart: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    
    @IBOutlet weak var contrainsLblDescriptionButton: NSLayoutConstraint!
    var productItem:Products!
    let viewColorViewers = #colorLiteral(red: 0.8304866552, green: 0.8354588747, blue: 0.8439782262, alpha: 1)
    var data: Any?
    
    var addUpdateVM:AddUpdateVM!
    var producServiceFR: ProductServiceFr!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        producServiceFR = ProductServiceFr()
        addUpdateVM = AddUpdateVM(vc_: self)
        // Do any additional setup after loading the view.
        configureUI()
        setDataItem()
    }
    
    func configureUI() {
        contrainsLblDescriptionButton.constant = 10
        btnAddCart.layoutIfNeeded()
        viewViewers.applyCorner(cornerRadius: 17,background: viewColorViewers.withAlphaComponent(0.6),shadowColor: .clear)
        
        btnAddCart.setCustomStyle(backgroundColor: .purple,
                                   titleColor: .white,
                                   cornerRadius: 20,
                                   title: "Añadir al carrito",
                                   isBold: true,
                                   fontSize: 20)
        viewPrice.applyTopShadow(shadowColor: .gray, shadowOpacity: 0.3, shadowRadius: 5, shadowOffset: CGSize(width: 0, height: -3))

    }
    
    func setDataItem(){
        if let item = data as? ItemConfig {
            productItem = item.product
        }
        if let item = productItem{
            lblTitle.text = item.title ?? ""
            lblDescription.text = item.description ?? ""
            lblViewers.text = "\(item.rating?.count ?? 0) vistas"
            lblRating.text = "\(item.rating?.rate ?? 0.0)"
            lblPrice.text = "$\(StringHelper.formatPrice(item.price ?? 0.0))"
            if imProduct.image == nil {
                if let url = URL(string: item.image ?? "") {
                    imProduct.loadImage(from: url, placeholder: UIImage(named: "placeholder")) { loadedImage in
                        if let _ = loadedImage {
                            //print("Image loaded successfully")
                        }
                    }
                }
            }
        }
        if let user_:Users = GlobalStorage.shared.get(forKey: StorageConstant.userData, as: Users.self) {
          
            if productItem.proveedorDB == FireConstant.provider{
                if user_.uid == productItem?.UID ?? ""{
                    btnDelete.isHidden = false
                    btnEdit.isHidden = false
                }else{
                    btnDelete.isHidden = true
                    btnEdit.isHidden = true
                }
            }else{
                btnDelete.isHidden = false
                btnEdit.isHidden = false
            }
        }
    }
    
    
    
    @IBAction func pressBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pressEdit(_ sender: UIButton) {
        NavigationHelper.presentScreen(on: self, withIdentifier: IdVcConstant.addUpdateProduct,data: data)
    }
    
    
    @IBAction func pressTrashItem(_ sender: UIButton) {
        AlertHelper.show(titulo: "Alerta", mensaje: "Desea eliminar el producto, \(productItem.title ?? "")",btnAccept: "Eliminar", en: self,onClick: {
            self.showLoad()
            if self.productItem.proveedorDB == FireConstant.provider{
                self.producServiceFR.deleteProductById(vc: self, documentId: self.productItem.idProduct ?? "") { success in
                    AlertHelper.show(titulo: "Alerta", mensaje: "Producto eliminado exitosamente", en: self, onClick:  {
                        NavigationHelper.goToHome()
                    })
                }
                return
            }
            self.addUpdateVM.deleteProduct(product: self.productItem) { product, success in
                self.hideLoad()
                if success{
                    AlertHelper.show(titulo: "Alerta", mensaje: "Producto eliminado exitosamente", en: self, onClick:  {
                        NavigationHelper.goToHome()
                    })
                }
            }
        },showCancel: true) {
            
        }
    }
    
    @IBAction func pressAddToCart(_ sender: UIButton) {
    }
    
    @IBAction func pressFavorite(_ sender: UIButton) {
    }
}
