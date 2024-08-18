//
//  WelcomeVC.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 10/8/24.
//

import UIKit

class WelcomeVC: UIViewController {

    @IBOutlet weak var imgWelcomw: UIImageView!
    @IBOutlet weak var lblBienvenido: UILabel!
    @IBOutlet weak var btnEmpecemos: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layoutIfNeeded()
        btnEmpecemos.layoutIfNeeded()
        btnEmpecemos.setCustomStyle(    backgroundColor: .purple,
                                        titleColor: .white,
                                        cornerRadius: 20,
                                        title: "Empecemos",
                                        isBold: true,
                                        fontSize: 20)
        
    }
    

    

    @IBAction func pressSingIn(_ sender: UIButton) {
        GlobalStorage.shared.save(true, forKey: StorageConstant.isWelcome)
        NavigationHelper.presentScreen(on: self, withIdentifier: IdVcConstant.login)
    }

}
