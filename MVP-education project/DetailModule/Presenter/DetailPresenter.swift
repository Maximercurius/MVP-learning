//
//  DetailPresenter.swift
//  MVP-education project
//
//  Created by Makarov_Maxim on 18.04.2022.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func setComment(comment: Comment?)
}

protocol DetailViewPresenterProtocol: AnyObject {
    init (view: DetailViewProtocol, networkService: NetworkSrviceProtocol, router: RouterProtocol, comment: Comment?)
    func setComment()
    func tap()
}

class DetailPresenter: DetailViewPresenterProtocol {
    weak var view: DetailViewProtocol?
    var router: RouterProtocol?
    let networkService: NetworkSrviceProtocol!
    var comment: Comment?
    
    required init(view: DetailViewProtocol, networkService: NetworkSrviceProtocol, router: RouterProtocol, comment: Comment?) {
        self.view = view
        self.networkService = networkService
        self.comment = comment
        self.router = router
    }
    func tap() {
        router?.poptoRoot()
    }
    
   public func setComment() {
       self.view?.setComment(comment: comment)
    }
}
