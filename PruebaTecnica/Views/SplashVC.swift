//
//  SplashVC.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 11/8/24.
//

import UIKit

class SplashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initBinds()
    }
    
    func initBinds(){
        //GlobalStorage.shared.remove(forKey: StorageConstant.isWelcome)
        //GlobalStorage.shared.remove(forKey: StorageConstant.isLogeed)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.navigateVC()
        }
    }
    
    func navigateVC() {
        guard let isWelcome: Bool = GlobalStorage.shared.get(forKey: StorageConstant.isWelcome, as: Bool.self), isWelcome else {
            NavigationHelper.presentScreen(on: self, withIdentifier: IdVcConstant.welcome)
            return
        }
        
        guard let isLogeed: Bool = GlobalStorage.shared.get(forKey: StorageConstant.isLogeed, as: Bool.self), isLogeed else {
            NavigationHelper.presentScreen(on: self, withIdentifier: IdVcConstant.login)
            return
        }
        
        NavigationHelper.goToHome()
    }
}
