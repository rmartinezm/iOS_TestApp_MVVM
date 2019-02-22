//
//  SignUpViewController.swift
//  InstintoBiker
//
//  Created by Roberto Martínez Medina on 20/02/19.
//  Copyright © 2019 Instinto Biker. All rights reserved.
//

import UIKit
import RxSwift
import SVProgressHUD

class SignUpViewController: UIViewController, SignUpRouter   {

    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    private lazy var viewModel: SignUpViewModelImpl = { return SignUpViewModelImpl(router: self, interactor: SignUpInteractorImpl()) }()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isToolbarHidden = false
        observeViewModel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func observeViewModel() {
        viewModel.loading.asObservable().subscribe(loadingObserver()).disposed(by: disposeBag)
        viewModel.message.asObservable().subscribe(messageObserver()).disposed(by: disposeBag)
    }
    
    @IBAction func onSignUpClickListener() {
        viewModel.signUp(email: textFieldEmail.text!, password: textFieldPassword.text!)
    }
    
    func navigateToMain() {
        let mainViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        self.navigationController?.pushViewController(mainViewController, animated: true)
    }
    
    
}
