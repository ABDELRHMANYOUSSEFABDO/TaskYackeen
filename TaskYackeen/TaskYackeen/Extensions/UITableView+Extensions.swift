//
//  UITableView+Extensions.swift
//   TaskYackeen
//
//  Created by Apple on 12/24/21..
//

import Foundation
import UIKit

extension UITableView {
    
    func registerCellNib<Cell: UITableViewCell>(cellClass: Cell.Type){
        self.register(UINib(nibName: String(describing: Cell.self), bundle: nil), forCellReuseIdentifier: String(describing: Cell.self))
    }


    func dequeue<Cell: UITableViewCell>() -> Cell{
        let identifier = String(describing: Cell.self)
        
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier) as? Cell else {
            fatalError("Error in cell")
        }
        
        return cell
    }
        
}
extension UITableViewCell {
    
    class var identifier: String {
        return String(describing: self)
    }
    static var reuseIdentifier: String {
           return NSStringFromClass(self)
       }
}
