//
//  DetilesUserVc.swift
//  TaskYackeen
//
//  Created by Apple on 12/25/21.
//

import UIKit

class DetilesUserVc: UIViewController {

    @IBOutlet var summaryTextView: UITextView!
    @IBOutlet var imageView: UIImageView!
    var summarytext = ""
    var imageUrl = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        summaryTextView.text = summarytext
        print("Image",imageUrl)
        imageView.loadImage(urlString: imageUrl)

    }



}
