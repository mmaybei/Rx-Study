//
//  ViewController.swift
//  Rx-Study
//
//  Created by 예삐 on 11/4/24.
//

import UIKit

import RxCocoa
import RxSwift
import SnapKit
import Then

final class ViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    
    private let textField = UITextField()
    private let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
        
        setAction()
    }
    
    private func setAction() {
        textField.rx.text
            .bind(to: label.rx.text)
            .disposed(by: disposeBag)
    }
}

private extension ViewController {
    func setStyle() {
        textField.do {
            $0.font = .systemFont(ofSize: 16, weight: .medium)
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.systemGray4.cgColor
            $0.layer.cornerRadius = 8
        }
        
        label.do {
            $0.text = "텍스트를 입력해주세요"
            $0.font = .systemFont(ofSize: 16, weight: .medium)
        }
    }
    
    func setUI() {
        view.backgroundColor = .white
        view.addSubviews(textField, label)
    }
    
    func setLayout() {
        textField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(120)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        label.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
    }
}
