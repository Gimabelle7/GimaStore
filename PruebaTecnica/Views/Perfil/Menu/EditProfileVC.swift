//
//  EditProfileVC.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 14/8/24.
//

import UIKit

class EditProfileVC: UIViewController {
    
    
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtLastName: UITextField!
    
    @IBOutlet weak var txtBirthDate: UITextField!
    
    @IBOutlet weak var txtPhoneNumber: UITextField!
    
    @IBOutlet weak var btnUpdate: UIButton!
        
    var vmEditProfile: EditProfileVM!
    override func viewDidLoad() {
        super.viewDidLoad()
        vmEditProfile = EditProfileVM(vc_: self)
        configureUI()
 
    }
    
    func configureUI(){
        btnUpdate.layoutIfNeeded()
        txtName.configure(for: .email,placeholder: "Nombres")
        txtLastName.configure(placeholder: "Apellidos")
        txtBirthDate.configure(placeholder: "Fecha de nacimiento")
        txtPhoneNumber.configure(for:.number,placeholder: "Número de teléfono")
        btnUpdate.setCustomStyle(backgroundColor: .purple,
                                   titleColor: .white,
                                   cornerRadius: 20,
                                   title: "Actualizar datos",
                                   isBold: true,
                                   fontSize: 20)
    }
    
    @IBAction func pressUpdate(_ sender: UIButton) {
        let user = Users(name: txtName.text ?? "",lastName: txtLastName.text ?? "",birthDate: txtBirthDate.text ?? "",phoneNumber: txtPhoneNumber.text ?? "")
        if vmEditProfile.validateForm(user: user){
            showLoad()
            vmEditProfile.updateDate(user: user, vc: self) { user, success in
                self.hideLoad()
                if !success{
                    AlertHelper.show(titulo: "Alerta", mensaje: "Datos actualizados correctamente", en: self) {
                        self.onDismiss?()
                        self.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
}
