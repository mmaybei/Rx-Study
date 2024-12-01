//
//  ViewModelType.swift
//  Rx-Study
//
//  Created by 예삐 on 11/12/24.
//

import Foundation

import RxSwift

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input, disposeBag: RxSwift.DisposeBag) -> Output
}
