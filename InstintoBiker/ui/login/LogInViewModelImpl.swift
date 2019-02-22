//
//  LoginViewModel.swift
//  InstintoBiker
//
//  Created by Roberto Martínez Medina on 05/02/19.
//  Copyright © 2019 Instinto Biker. All rights reserved.
//

import Foundation
import RxCocoa

class LogInViewModelImpl : LogInViewModel {
    
    private var interactor: LogInInteractor? = nil
    private var router: LogInRouter? = nil
    
    let loading = BehaviorRelay<Bool>(value: false)
    let message = BehaviorRelay<String?>(value: nil)
    
    init(router: LogInRouter, interactor: LogInInteractor) {
        self.router = router
        self.interactor = interactor
    }
    
    func logIn(email: String, password: String){
        loading.accept(true)
        self.interactor?.logInWithEmailAndPassword(email: email, password: password) { error in
            self.loading.accept(false)
            if(error == nil){
                self.router?.navigateToMain()
            } else {
                self.message.accept(error!)
            }
        }
    }
    
}
