//
//  LoginViewController.swift
//  InstintoBiker
//
//  Created by Roberto Martínez Medina on 10/02/19.
//  Copyright © 2019 Instinto Biker. All rights reserved.
//

import UIKit
import RxSwift
import SVProgressHUD

class LogInViewController: UIViewController, LogInRouter {
    
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    private lazy var viewModel: LogInViewModelImpl = { return LogInViewModelImpl(router: self, interactor: LogInInteractorImpl()) }()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeViewModel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func observeViewModel() {
        viewModel.loading.asObservable().subscribe(loadingObserver()).disposed(by: disposeBag)
        viewModel.message.asObservable().subscribe(messageObserver()).disposed(by: disposeBag)
    }
    
    @IBAction func onLogInClickListener() {
        viewModel.logIn(email: textFieldEmail.text!, password: textFieldPassword.text!)
    }
    
    func navigateToMain() {
        let mainViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        self.navigationController?.pushViewController(mainViewController, animated: true)
    }
    
}

