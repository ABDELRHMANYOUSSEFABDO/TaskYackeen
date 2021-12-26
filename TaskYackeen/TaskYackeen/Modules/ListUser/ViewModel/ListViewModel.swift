//
//  ListViewModel.swift
//  TaskYackeen
//
//  Created by Apple on 12/24/21.
//
import RxSwift
import RxCocoa
import Foundation
class listUserViewModel:BaseViewModel{
    private var DateList = PublishSubject<[ListElement]>()

    var DateListObservel : Observable <[ListElement]> {
     return DateList
          }
    let disposeBag = DisposeBag()

    let ListUserRepository: HomeRepository
    init(
         repository: HomeRepository) {
        self.ListUserRepository = repository
    }
    func viewDidLoad(){
        bind()
    }
    func bind(){
        ListUserRepository.fetchListData().subscribe(onNext: { [weak self] items in
            self?.DateList.onNext(items)
            
        }).disposed(by: disposeBag)
    }
}
