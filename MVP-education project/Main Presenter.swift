//
//  Main Presenter.swift
//  MVP-education project
//
//  Created by Makarov_Maxim on 17.04.2022.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func setGreeting(greeting: String)
}

protocol MainviewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, person: Person)
    
    func showGreeting()
}

class MainPresenter: MainviewPresenterProtocol {
    
    let view: MainViewProtocol
    let person: Person
    
    required init(view: MainViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }
    
    func showGreeting() {
        let greeting = self.person.firstName + " " + self.person.lastName
        self.view.setGreeting(greeting: greeting)
        
    }
}
