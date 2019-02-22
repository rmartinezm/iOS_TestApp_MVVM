//
//  UIViewControllerExt.swift
//  InstintoBiker
//
//  Created by Roberto Martínez Medina on 10/02/19.
//  Copyright © 2019 Instinto Biker. All rights reserved.
//

import UIKit
import RxSwift
import SVProgressHUD

extension UIViewController {
    
    /**
     Creates a Observable for loading indicator.
     - Returns: A observable to show a progress hud.
     */
    func loadingObserver() -> ((RxSwift.Event<Bool>) -> Void) {
        let observer: (RxSwift.Event<Bool>) -> Void =  { it in
            guard let isLoading = it.element else { return }
            if isLoading {
                SVProgressHUD.show()
            } else {
                SVProgressHUD.dismiss()
            }
        }
        return observer
    }
    
    /**
     Creates a Observable for messages.
     - Returns: A observable to show a alert message.
     */
    func messageObserver() -> ((RxSwift.Event<String?>) -> Void) {
        let observer: (RxSwift.Event<String?>) -> Void =  { it in
            if it.element != nil {
                guard let message: String = it.element! else { return }
                print(message)
            }
        }
        return observer
    }
    
    /**
     Navigate to another ViewController with the identifier recibed.
     */
    func navigateTo(controllerIdentifier: String){
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: controllerIdentifier)
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
    
}
