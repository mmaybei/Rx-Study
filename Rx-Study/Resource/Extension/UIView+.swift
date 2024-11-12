//
//  UIView+.swift
//  Rx-Study
//
//  Created by 예삐 on 11/4/24.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
    
}
