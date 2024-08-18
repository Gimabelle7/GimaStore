//
//  AddUpdateVC.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 16/8/24.
//

import UIKit

class AddUpdateVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate , DataReceiver {
    var data: Any?
    @IBOutlet weak var lbltitle: UILabel!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var txtxImage: UITextField!
    @IBOutlet weak var txtCategory: UITextField!
    @IBOutlet weak var txtDescription: UITextView!
    @IBOutlet weak var viewDescription: UIView!
    @IBOutlet weak var btnAddUpdate: UIButton!
   
    let viewColorViewers = #colorLiteral(red: 0.8304866552, green: 0.8354588747, blue: 0.8439782262, alpha: 1)
    var productItem:Products!
    var titleHeader:String = "Crear producto"
    var titleButton:String = "Guardar"
    var isCreate = true
    
    var itemsCategories : [String] = []
    var pickerView: UIPickerView!
    var indexSelectCategorie = 0
    
    var addUpdateVM:AddUpdateVM!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addUpdateVM = AddUpdateVM(vc_: self)
        initPickerView()
        setDataItem()
        initBinds()
    }
    
    func setDataItem(){
        if let item = data as? ItemConfig {
            productItem = item.product
            itemsCategories = item.categories
            itemsCategories.remove(at: 0)
            
        }
        if let item = productItem{
            titleHeader = "Editar Producto"
            titleButton = "Actualizar"
            isCreate = false
            txtTitle.text = item.title ?? ""
            txtxImage.text = item.image ?? ""
            txtDescription.text = item.description ?? ""
            txtPrice.text = "\(item.price ?? 0.0)"
            setDefaultCategorie(titulo: item.category ?? "")
        }
        if isCreate{
            let titulo = "Seleccione una categoría"
            itemsCategories.insert(titulo, at: 0)
            setDefaultCategorie(titulo: titulo)
        }
    }
    
    func setDefaultCategorie(titulo:String){
        if let index = itemsCategories.firstIndex(of:titulo) {
            txtCategory.text = itemsCategories[index]
            pickerView.selectRow(index, inComponent: 0, animated: false)
        }
    }
    
    func initPickerView(){
        // Initialize the picker view
          pickerView = UIPickerView()
          pickerView.dataSource = self
          pickerView.delegate = self
          txtCategory.inputView = pickerView
    }
    
    
    func initBinds() {
        lbltitle.text = titleHeader
        btnAddUpdate.layoutIfNeeded()
        txtTitle.configure(for: .email,placeholder: "Titulo")
        txtPrice.configure(placeholder: "Precio")
        txtxImage.configure(placeholder: "URL Imagen")
        txtCategory.configure(placeholder: "Categoria")
        viewDescription.applyCorner(cornerRadius: 17,background: viewColorViewers.withAlphaComponent(0.4),shadowColor: .clear)
        btnAddUpdate.setCustomStyle(backgroundColor: .purple,
                                   titleColor: .white,
                                   cornerRadius: 20,
                                    title: titleButton,
                                   isBold: true,
                                   fontSize: 20)
    }
    


    @IBAction func pressBtnAddUpdate(_ sender: UIButton) {
        let product_ = Products(idProduct:productItem.idProduct ?? "",title: txtTitle.text ?? "",category: txtCategory.text ?? "",description: txtDescription.text ?? "",image: txtxImage.text ?? "",proveedorDB: productItem.proveedorDB ?? "",price: Double(txtPrice.text ?? ""))
            if addUpdateVM.validateForm(product: product_){
                showLoad()
                if isCreate{
                    addUpdateVM.createProduct(product: product_) { product, success in
                        self.hideLoad()
                        if success{
                            AlertHelper.show(titulo: "Alerta", mensaje: "Producto creado exitosamente", en: self, onClick:   {
                                NavigationHelper.goToHome()
                            })
                        }
                    }
                    return
                }
                addUpdateVM.updateProduct(product: product_) { product, success in
                    self.hideLoad()
                    if success{
                        AlertHelper.show(titulo: "Alerta", mensaje: "Producto actualizado exitosamente", en: self, onClick: {
                            NavigationHelper.goToHome()
                        })
                    }
                }
              
            }
    
    }
        
    @IBAction func pressBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - UIPickerViewDataSource

        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }

        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return itemsCategories.count
        }

        // MARK: - UIPickerViewDelegate

        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return itemsCategories[row]
        }

        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            txtCategory.text = itemsCategories[row]
            txtCategory.resignFirstResponder() // Dismiss the picker view
        }
    
}
