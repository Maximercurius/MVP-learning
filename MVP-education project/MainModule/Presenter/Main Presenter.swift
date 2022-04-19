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
    init(view: MainViewProtocol, networkService: NetworkSrviceProtocol, router: RouterProtocol)
    func getComment()
    var comments: [Comment]? { get set }
    func tapOnTheComment(comment: Comment?)

}

class MainPresenter: MainviewPresenterProtocol {
    
    weak var view: MainViewProtocol?
    var router: RouterProtocol?
    let networkService: NetworkSrviceProtocol!
    var comments: [Comment]?

    required init(view: MainViewProtocol, networkService: NetworkSrviceProtocol,router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        getComment()
    }
    
    func tapOnTheComment(comment: Comment?) {
        router?.showDetail(comment: comment)
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
