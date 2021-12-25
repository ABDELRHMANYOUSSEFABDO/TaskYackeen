//
//  BaseWireframe.swift
//  PizzaWorld
//
//  Created by Osama on 10/15/20.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift


protocol ViewModel {
    
}

class BaseWireframe<T: BaseViewModel>: UIViewController {
    var viewModel: T!

    lazy var disposeBag: DisposeBag = {
        return DisposeBag()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind(viewModel: viewModel)
    }
    
    init(viewModel: T) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    // Storyboard setup
  
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    func bind(viewModel: T){
        fatalError("Please override bind function")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

extension BaseWireframe {
    func displayError(text: String){
        let alert = UIAlertController(title: text, message: nil, preferredStyle: .alert)
        let cancelButton = UIAlertAction.init(title: "Cancel", style: .destructive, handler: nil)
        alert.addAction(cancelButton)
        self.present(alert, animated: true, completion: nil)
    }
}

extension BaseWireframe where T: BaseViewModel {
    func bindLoadings(){
        print("Base view model is implemneted here..")
    }
}
