//
//  LoginView.swift
//  Rx-Study
//
//  Created by 예삐 on 11/12/24.
//

import UIKit

import SnapKit
import Then

final class LoginView: UIView {
    private let titleImage = UIImageView().then {
        $0.image = .imgAppStore
    }
    
    let idTextField = CustomTextField(placeholder: "아이디").then {
        $0.keyboardType = .asciiCapable
        $0.autocapitalizationType = .none
    }
    
    let passwordTextField = CustomTextField(placeholder: "비밀번호").then {
        $0.keyboardType = .asciiCapable
        $0.autocapitalizationType = .none
//        $0.isSecureTextEntry = true
    }
    
    let errorLabel = UILabel().then {
        $0.textColor = .systemBlue
        $0.font = .systemFont(ofSize: 12, weight: .medium)
    }
    
    let loginButton = UIButton().then {
        $0.setTitle("로그인하기", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 4
        $0.isEnabled = false
    }
    
    private let registerButton = UIButton().then {
        $0.setTitle("아직 계정이 없으신가요?", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension LoginView {
    func setUI() {
        backgroundColor = .white
        addSubviews(
            titleImage,
            idTextField,
            passwordTextField,
            errorLabel,
            loginButton,
            registerButton
        )
    }
    
    func setLayout() {
        titleImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(92)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(52)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleImage.snp.bottom).offset(48)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        errorLabel.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(6)
            $0.leading.equalToSuperview().offset(20)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(36)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        registerButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
        }
    }
}
