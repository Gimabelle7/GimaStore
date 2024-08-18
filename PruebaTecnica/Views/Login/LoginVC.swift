//
//  LoginVC.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 8/8/24.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {
    
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    @IBOutlet weak var btnSignUp: UIButton!
    
    @IBOutlet weak var lblRegister: UILabel!
    
    @IBOutlet weak var btnRegister: UIButton!

    
    var vmLogin : LoginVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vmLogin = LoginVM(vc_: self)
        initBinds()
    }
    
    
    func initBinds() {
        btnLogin.layoutIfNeeded()
        txtEmail.configure(for: .email,placeholder: "Email")
        txtPassword.configure(for: .password,placeholder: "Password")
        btnLogin.setCustomStyle(backgroundColor: .purple,
                                        titleColor: .white,
                                        cornerRadius: 20,
                                        title: "Iniciar Sesión",
                                        isBold: true,
                                        fontSize: 20)
        lblRegister.attributedText = UiLabelHelper.twoText(text1: "No tienes una cuenta? ", color1:.black, text2: "Registrate", color2: .purple)
    }
    
    @IBAction func pressLogin(_ sender: UIButton) {
        sender.showLoading()
        let email = txtEmail.text ?? ""
        let password = txtPassword.text ?? ""
        if email.isEmpty{
            return
        }
        if vmLogin.validateForm(txtEmail: email, password: password){
        
            vmLogin.signIn(email: email, password: password, vc: self) { user,sucess in
                sender.hideLoading()
                if !sucess{
                    NavigationHelper.goToHome()
                }
            }
        }
    }
    
    @IBAction func pressRegister(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let registerVC = storyboard.instantiateViewController(withIdentifier: "idRegister") as! RegisterVC
        present(registerVC, animated: true)
        
    }
}

