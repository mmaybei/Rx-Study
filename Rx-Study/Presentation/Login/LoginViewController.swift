//
//  LoginViewController.swift
//  Rx-Study
//
//  Created by 예삐 on 11/12/24.
//

import UIKit

final class LoginViewController: UIViewController {
    
    private let rootView = LoginView()
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTarget()
        setGesture()
    }
    
    private func setTarget() {
        rootView.loginButton.addTarget(
            self,
            action: #selector(loginButtonDidTap),
            for: .touchUpInside
        )
    }
    
    private func setGesture() {
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard)
        )
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func loginButtonDidTap() {
         
    }
    
    @objc
    private func dismissKeyboard() {
        view.endEditing(true)
    }
}
