//
//  PerfilVC.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 12/8/24.
//

import UIKit

class PerfilVC: UIViewController {
    
    @IBOutlet weak var viewName: UIView!
    @IBOutlet weak var viewPerfil: UIView!
    @IBOutlet weak var lblPerfil: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var viewEdit: UIView!
    @IBOutlet weak var imgIconEdit: UIImageView!
    @IBOutlet weak var imgIconEditRight: UIImageView!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var lblEdit: UILabel!
    @IBOutlet weak var viewChangePassword: UIView!
    @IBOutlet weak var imgIconPassword: UIImageView!
    @IBOutlet weak var imgIconPasswordRigth: UIImageView!
    @IBOutlet weak var btnPassword: UIButton!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var viewInformation: UIView!
    @IBOutlet weak var imgIconInformation: UIImageView!
    @IBOutlet weak var imgIconInformationRigth: UIImageView!
    @IBOutlet weak var btnInformation: UIButton!
    @IBOutlet weak var lblInformation: UILabel!
    @IBOutlet weak var viewLogout: UIView!
    @IBOutlet weak var imgIconLogout: UIImageView!
    @IBOutlet weak var btnLogout: UIButton!
    @IBOutlet weak var lblLogout: UILabel!
    
    let uriReadme = "https://github.com/Gimabelle7/GimaStore/blob/main/README.md"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        configureUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.callOnDismiss()
    }
    
    func initData(){

        if let user:Users = GlobalStorage.shared.get(forKey: StorageConstant.userData, as: Users.self) {
            let name = user.name ?? ""
            if let firstChar = name.firstLetter() {
                lblPerfil.text = firstChar
                lblName.text = name
                lblEmail.text = user.email
            }
        }
    }
    
    
    func configureUI() {
        viewName.applyCircle(borderColor: .purple.withAlphaComponent(0.2))
        viewEmail.applyCorner(cornerRadius: 15,shadowColor: .clear)
        viewEdit.applyCorner(cornerRadius: 17.5,shadowColor: .gray.withAlphaComponent(0.2))
        viewChangePassword.applyCorner(cornerRadius: 17.5,shadowColor: .gray.withAlphaComponent(0.2))
        viewInformation.applyCorner(cornerRadius: 17.5,shadowColor: .gray.withAlphaComponent(0.2))
        viewLogout.applyCorner(cornerRadius: 17.5,shadowColor: .gray.withAlphaComponent(0.2))
    }
    
    
    @IBAction func pressEditProfile(_ sender: UIButton) {
        NavigationHelper.presentScreen(on: self, withIdentifier: IdVcConstant.editProfile,stylePresent: .pageSheet, onDismiss:  {
            self.initData()
        })
    }
    
    @IBAction func pressChangePass(_ sender: UIButton) {
        NavigationHelper.presentScreen(on: self, withIdentifier: IdVcConstant.changePassword,stylePresent: .pageSheet)
    }
    
    @IBAction func pressInfo(_ sender: UIButton) {
        UIApplication.openURLInBrowser(urlString: uriReadme) { success in
            if success{
                AlertHelper.show(titulo: "Error", mensaje: "No se pudo abrir la url", en: self)
            }
        }

    }
    
    @IBAction func pressLogOut(_ sender: UIButton) {
        GlobalStorage.shared.signOut(vc: self)
    }
    
}
