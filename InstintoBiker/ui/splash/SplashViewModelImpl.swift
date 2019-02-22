//
//  SplashViewModel.swift
//  InstintoBiker
//
//  Created by Roberto Martínez Medina on 10/02/19.
//  Copyright © 2019 Instinto Biker. All rights reserved.
//

import Foundation
import RxCocoa

class SplashViewModelImpl : SplashViewModel {
    
    private var router: SplashRouter? = nil
    private var interactor: SplashInteractor? = nil
    
    let loading = BehaviorRelay<Bool>(value: false)
    let message = BehaviorRelay<String?>(value: nil)
    
    init(router: SplashRouter, interactor: SplashInteractor) {
        self.router = router
        self.interactor = interactor
    }
    
    func verifyCurrentUser() {
        loading.accept(true)
        interactor?.loadCurrentUser { error in
            self.loading.accept(false)
            if error == nil {
                if MyUser.getInstance()?.uid == nil {
                    self.router?.navigateToWelcome()
                } else {
                    self.router?.navigateToMain()
                }
            } else {
                self.message.accept(error!)
            }
        }
    }
    
}

