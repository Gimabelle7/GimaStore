//
//  ChangePasswordVC.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 14/8/24.
//

import UIKit

class ChangePasswordVC: UIViewController {
    @IBOutlet weak var txtOldPassword: UITextField!
    @IBOutlet weak var txtNewPassword: UITextField!
    @IBOutlet weak var btnChangePassword: UIButton!
    
    var vmChangepassword:ChangePasswordVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vmChangepassword = ChangePasswordVM(vc_: self)
        configureUI()
    }
    
    func configureUI(){
        btnChangePassword.layoutIfNeeded()
        txtOldPassword.configure(placeholder: "Anterior contraseña")
        txtNewPassword.configure(placeholder: "Nueva contraseña")
        btnChangePassword.setCustomStyle(backgroundColor: .purple,
                                   titleColor: .white,
                                   cornerRadius: 20,
                                   title: "Actualizar contraseña",
                                   isBold: true,
                                   fontSize: 20)
    }

    @IBAction func pressChangePassword(_ sender: UIButton) {
   
        if vmChangepassword.validateForm(oldPassword: txtOldPassword.text ?? "", newPassword: txtNewPassword.text ?? ""){
            showLoad()
            vmChangepassword.updatePassword(password: txtNewPassword.text ?? "", vc: self) { success in
                self.hideLoad()
                if !success{
                    AlertHelper.show(titulo: "Alerta", mensaje: "Su contraseña se actualizo correctamente, por favor vuelva a iniciar sesión", en: self) {
                        GlobalStorage.shared.remove(forKey: StorageConstant.isLogeed)
                        GlobalStorage.shared.remove(forKey: StorageConstant.userData)
                        NavigationHelper.presentScreen(on: self, withIdentifier: IdVcConstant.login)
                    }
                }
            }
        }
    }
    

}
