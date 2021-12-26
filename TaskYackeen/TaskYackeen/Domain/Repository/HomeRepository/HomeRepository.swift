//
//  HomeRepository.swift
//  TaskYackeen
//
//  Created by Apple on 12/25/21.
//

import Foundation
import RxSwift
import RxCocoa

protocol HomeRepository {
    func fetchListData() -> Observable<[ListElement]>
}

class HomeRepositoryImpl: HomeRepository {
    
    let networkClient: NetworkClient
    
    init(networkClient: NetworkClient = NetworkClient()) {
        self.networkClient = networkClient
    }
    var items: [ListElement] = []
    func fetchListData() -> Observable<[ListElement]> {
        Observable<[ListElement]>.create { [weak self] (item) -> Disposable in
            self?.networkClient.performRequest([ListElement].self) { (result) in
                switch result {
                case .success(let data):
                    self?.items = data

                    item.onNext(data)
                    item.onCompleted()
                case .failure(let error):
                    item.onError(error)
                }
            }
            return Disposables.create()
        }
    }
    
    
}
