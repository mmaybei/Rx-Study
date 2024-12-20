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
    
    private let titleLabel = UILabel()
    private let textField = UITextField()
    private let label = UILabel()
    private let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
        
        setAction()
    }
    
    private func setAction() {
        button.rx.tap
            .subscribe(onNext: { [self] in
                print("\(textField.text ?? "")")
            })
            .disposed(by: disposeBag)
        
        textField.rx.text
            .bind(to: label.rx.text)
            .disposed(by: disposeBag)
        
        textField.rx.text
            .map { ($0?.count ?? 0) < 10 ? .black : .systemGray4 }
            .bind(to: textField.rx.textColor)
            .disposed(by: disposeBag)
    }
}

private extension ViewController {
    func setStyle() {
        titleLabel.do {
            $0.text = "10자 이내로 입력하세요"
            $0.font = .systemFont(ofSize: 16, weight: .medium)
        }
        
        textField.do {
            $0.font = .systemFont(ofSize: 16, weight: .medium)
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.systemGray4.cgColor
            $0.layer.cornerRadius = 8
        }
        
        label.do {
            $0.font = .systemFont(ofSize: 16, weight: .medium)
        }
        
        button.do {
            $0.setTitle("입력 완료", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
            $0.backgroundColor = .black
            $0.layer.cornerRadius = 16
        }
    }
    
    func setUI() {
        view.backgroundColor = .white
        view.addSubviews(titleLabel, textField, label, button)
    }
    
    func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(84)
            $0.centerX.equalToSuperview()
        }
        
        textField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(120)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        label.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        button.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-40)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
    }
}
