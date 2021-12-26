//
//  BaseViewModel.swift
//  TaskYackeen
//
//  Created by Apple on 12/25/21.
//

import Foundation
import RxSwift
import RxCocoa

class BaseViewModel: ViewModel {
    var isLoading: PublishSubject<Bool> = .init()
    var displayError: PublishSubject<String> = .init()
    
    
}
