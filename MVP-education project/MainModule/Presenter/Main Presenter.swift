//
//  Main Presenter.swift
//  MVP-education project
//
//  Created by Makarov_Maxim on 17.04.2022.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func succes()
    func failure(error: Error)
}

protocol MainviewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, networkService: NetworkSrviceProtocol)
    func getComment()
    var comments: [Comment]? { get set }

}

class MainPresenter: MainviewPresenterProtocol {
   
    weak var view: MainViewProtocol?
    let networkService: NetworkSrviceProtocol!
    var comments: [Comment]?

    required init(view: MainViewProtocol, networkService: NetworkSrviceProtocol) {
        self.view = view
        self.networkService = networkService
        getComment()
    }
    func getComment() {
        networkService.getComments { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.succes()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }

        }
    }
    
          
}
