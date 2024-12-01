//
//  LoginViewController.swift
//  Rx-Study
//
//  Created by 예삐 on 11/12/24.
//

import UIKit

import RxCocoa
import RxSwift

final class LoginViewController: UIViewController {
    
    private let rootView = LoginView()
    
    private let viewModel = LoginViewModel()
    
    private let disposeBag = DisposeBag()
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
    }
    
    private func bindViewModel() {
        let input = LoginViewModel.Input(
            idText: rootView.idTextField.rx.text.orEmpty.asObservable(),
            passwordText: rootView.passwordTextField.rx.text.orEmpty.asObservable(), 
            loginButtonDidTap: rootView.loginButton.rx.tap.asObservable()
        )
        
        let output = viewModel.transform(input: input, disposeBag: disposeBag)
        
        output.idIsValid
            .map { $0 ? .black : .systemGray }
            .bind(to: rootView.idTextField.rx.textColor)
            .disposed(by: disposeBag)
        
        output.passwordIsValid
            .map { $0 ? .black : .systemGray }
            .bind(to: rootView.passwordTextField.rx.textColor)
            .disposed(by: disposeBag)
        
        output.loginButtonIsEnabled
            .subscribe(onNext: { [weak self] isEnabled in
                self?.rootView.loginButton.isEnabled = isEnabled
                self?.rootView.loginButton.backgroundColor = isEnabled ? .systemBlue : .systemGray
            })
            .disposed(by: disposeBag)
        
        output.isSucceed
            .subscribe(onNext: { [weak self] isSucceed in
                self?.showAlert(isSucceed: isSucceed)
            })
            .disposed(by: disposeBag)
    }
    
    private func showAlert(isSucceed: Bool) {
        let title = isSucceed ? "로그인 성공" : "로그인 실패"
        let message = isSucceed ? "당신은 수야미가 맞습니다!" : "당신은 수야미가 아닙니다!"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(action)
        present(alert, animated: true)
    }
}
