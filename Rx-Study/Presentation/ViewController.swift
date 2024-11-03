//
//  ViewController.swift
//  Rx-Study
//
//  Created by 예삐 on 11/4/24.
//

import UIKit
import SnapKit
import Then

final class ViewController: UIViewController {

    private let textField = UITextField().then {
        $0.font = .systemFont(ofSize: 16, weight: .medium)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.systemGray4.cgColor
        $0.layer.cornerRadius = 8
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
}

private extension ViewController {
    func setUI() {
        view.backgroundColor = .white
        view.addSubview(textField)
    }
    
    func setLayout() {
        textField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(120)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
    }
}
