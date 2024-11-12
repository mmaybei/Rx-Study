//
//  CustomTextField.swift
//  Rx-Study
//
//  Created by 예삐 on 11/12/24.
//

import UIKit

final class CustomTextField: UITextField {
    init(placeholder: String) {
        super.init(frame: .zero)
        
        setTextField(placeholder: placeholder)
//        self.delegate = self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTextField(placeholder: String = "") {
        setPlaceholder(text: placeholder, color: .systemGray4)
        font = .systemFont(ofSize: 16, weight: .medium)
        setLayer(borderWidth: 1, borderColor: .systemGray4, cornerRadius: 4)
        addPadding(left: 20, right:20)
    }
}

//extension CustomTextField: UITextFieldDelegate {
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        textField.layer.borderColor = UIColor.systemBlue.cgColor
//    }
//    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        textField.layer.borderColor = UIColor.systemGray.cgColor
//    }
//}
