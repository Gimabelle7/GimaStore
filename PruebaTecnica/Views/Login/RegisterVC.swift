//
//  RegisterVC.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 9/8/24.
//

import UIKit

class RegisterVC: UIViewController {
    
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtApellido: UITextField!
    
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtContraseña: UITextField!
    
    @IBOutlet weak var btnRegister: UIButton!
    
    var registerVM : RegisterVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerVM = RegisterVM(vc_: self)
        initBinds()
    }
    
    
    func initBinds() {
        btnRegister.layoutIfNeeded()
        txtEmail.configure(for: .email,placeholder: "Email")
        txtNombre.configure(placeholder: "Nombre")
        txtApellido.configure(placeholder: "Apellido")
        txtContraseña.configure(for: .password,placeholder: "Password")
        btnRegister.setCustomStyle(backgroundColor: .purple,
                                   titleColor: .white,
                                   cornerRadius: 20,
                                   title: "Registrarse",
                                   isBold: true,
                                   fontSize: 20)
    }
    
    
    
    @IBAction func btnPressRegister(_ sender: UIButton) {
       
        let email = txtEmail.text ?? ""
        let lastName = txtApellido.text ?? ""
        let name = txtNombre.text ?? ""
        let password = txtContraseña.text ?? ""
        
        if registerVM.validateForm(txtEmail: email, txtName: name, txtLastName: lastName, password: password){
            sender.showLoading()
            let payload = Users(email: email,password: password,name: name,lastName:  lastName)
            registerVM.signUp(user: payload, vc: self) { user, success in
                sender.hideLoading()
                if !success{
                    NavigationHelper.goToHome()
                } 
            }
        }
    }
}
