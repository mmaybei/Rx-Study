//
//  LoginViewModel.swift
//  Rx-Study
//
//  Created by 예삐 on 11/12/24.
//

import Foundation

import RxCocoa
import RxSwift

final class LoginViewModel {
    var id: String { idRelay.value }
    var password: String { passwordRelay.value }
    
    private let idRelay = BehaviorRelay(value: "")
    private let passwordRelay = BehaviorRelay(value: "")
}

extension LoginViewModel: ViewModelType {
    struct Input {
        let idText: Observable<String>
        let passwordText: Observable<String>
        let loginButtonDidTap: Observable<Void>
    }
    
    struct Output {
        let idIsValid: Observable<Bool>
        let passwordIsValid: Observable<Bool>
        let loginButtonIsEnabled: Observable<Bool>
        let isSucceed: Observable<Bool>
    }
    
    func transform(input: Input, disposeBag: RxSwift.DisposeBag) -> Output {
        input.idText
            .bind(to: idRelay)
            .disposed(by: disposeBag)
        
        input.passwordText
            .bind(to: passwordRelay)
            .disposed(by: disposeBag)
        
        let idIsValid = input.idText
            .map { $0.count > 5 }
        
        let passwordIsValid = input.passwordText
            .map { $0.count > 5 }
        
        let loginButtonIsEnabled = Observable.combineLatest(idIsValid, passwordIsValid) { $0 && $1 }
        
        let isSucceed = input.loginButtonDidTap
            .map { self.id == "suyeon" && self.password == "suyeon" }
        
        return Output(
            idIsValid: idIsValid,
            passwordIsValid: passwordIsValid,
            loginButtonIsEnabled: loginButtonIsEnabled, 
            isSucceed: isSucceed
        )
    }
}
