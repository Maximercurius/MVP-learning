//
//  ViewController.swift
//  MVP-education project
//
//  Created by Makarov_Maxim on 17.04.2022.
//

import UIKit

class MainViewController: UIViewController {
    //MARK: - IBOutlet
    
    @IBOutlet weak var greetingLabel: UILabel!
    
    var presenter: MainviewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func didTapButtonAction(_ sender: Any) {
        self.presenter.showGreeting()
    }
}

extension MainViewController: MainViewProtocol {
    func setGreeting(greeting: String) {
        self.greetingLabel.text = greeting
    }
    
    
}

