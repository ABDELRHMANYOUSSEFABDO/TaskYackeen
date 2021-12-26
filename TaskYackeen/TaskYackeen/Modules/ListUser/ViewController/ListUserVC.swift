//
//  ListUserVC.swift
//  TaskYackeen
//
//  Created by Apple on 12/24/21.
//

import UIKit

class ListUserVC: BaseWireframe<listUserViewModel>{
    @IBOutlet var listTableView: UITableView!{
    
        didSet{
            listTableView.registerCellNib(cellClass: ListUserTableViewCell.self)
            listTableView.contentInset = .init(top: 0, left: 0, bottom: 35, right: 0)
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func bind(viewModel: listUserViewModel) {
        viewModel.bind()
        viewModel.DateListObservel.bind( to: listTableView.rx.items(cellIdentifier: "ListUserTableViewCell", cellType: ListUserTableViewCell.self)) {
            row , service ,cell in
            cell.nameLabel.text  = service.show?.name
            cell.RuntimeLabel.text = service.show?.runtime?.description
            cell.LinkButton.setTitle(service.show?.url, for: .normal)
            cell.premieredLabel.text =  service.show?.premiered
            cell.imageList.loadImage(urlString: service.show?.image?.original ?? "")
            cell.ratingView.configureWithRating(rating: service.show?.rating.average ?? 0)
            
        }.disposed(by: viewModel.disposeBag)
        
        
        listTableView.rx.modelSelected(ListElement.self)
                   .subscribe(onNext: { [weak self] model in
                       guard let self = self else { return }
                       let vc = DetilesUserVc()
                    vc.summarytext = model.show?.summary ?? ""
                    vc.imageUrl = model.show?.image?.original ?? ""
                    self.present(vc, animated: true, completion: nil)
                   }).disposed(by: disposeBag)
    }


   
}
