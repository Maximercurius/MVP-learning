//
//  DetailViewController.swift
//  MVP-education project
//
//  Created by Makarov_Maxim on 18.04.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var commentLabel: UILabel!
    
    var presenter: DetailViewPresenterProtocol!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setComment()

    }
    @IBAction func tapAction(_ sender: Any) {
        presenter.tap()
    }
}
extension DetailViewController: DetailViewProtocol{
    func setComment(comment: Comment?) {
        commentLabel.text = comment?.body
    }
    
    
}
