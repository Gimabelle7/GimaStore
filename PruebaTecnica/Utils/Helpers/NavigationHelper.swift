//
//  NavigationHelper.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 8/8/24.

import Foundation
import UIKit

protocol DataReceiver {
    var data: Any? { get set }
}

class NavigationHelper {
    
    
    static func presentScreen(on viewController: UIViewController, withIdentifier identifier: String, fromStoryboard storyboardName: String = "Main",stylePresent: UIModalPresentationStyle = .fullScreen,  animated: Bool = true, data: Any? = nil, completion: (() -> Void)? = nil,onDismiss: (() -> Void)? = nil) {
        
        // Cargar el storyboard
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        
        // Instanciar el ViewController por su identificador
        let destinationVC = storyboard.instantiateViewController(withIdentifier: identifier)
        if var dataReceiver = destinationVC as? DataReceiver {
            dataReceiver.data = data
        }
        destinationVC.modalPresentationStyle = stylePresent
        destinationVC.onDismiss = onDismiss

        // Presentar el ViewController
        viewController.present(destinationVC, animated: animated, completion: completion)
    }
    
    static func pushScreen(on navigationController: UINavigationController, withIdentifier identifier: String, fromStoryboard storyboardName: String = "Main", animated: Bool = true) {
        
        // Cargar el storyboard
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        
        // Instanciar el ViewController por su identificador
        let destinationVC = storyboard.instantiateViewController(withIdentifier: identifier)
        
        // Hacer push al ViewController
        navigationController.pushViewController(destinationVC, animated: animated)
    }
    
    static func goToHome() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let tabBarController = storyboard.instantiateViewController(withIdentifier: "TabBarController") as? UITabBarController else {
            return
        }
        tabBarController.tabBar.tintColor = .purple
    // Configurar los íconos para cada UITabBarItem
      if let viewControllers = tabBarController.viewControllers {
          for (index, viewController) in viewControllers.enumerated() {
              if let tabBarItem = viewController.tabBarItem {
                  
                  // Configura los íconos según el índice
                  switch index {
                  case 0:
                      tabBarItem.image = UIImage(systemName: "cart") // Ícono para el primer ítem
                      tabBarItem.title = "Productos"
                      
                  case 1:
                      tabBarItem.image = UIImage(systemName: "person") // Ícono para el segundo ítem
                      tabBarItem.title = "Perfil"
                  default:
                      break
                  }
              }
          }
      }
        
        // Cambia el rootViewController de la ventana
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = tabBarController
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {
                window.makeKeyAndVisible()
            }, completion: nil)
        }
    }
    
}
