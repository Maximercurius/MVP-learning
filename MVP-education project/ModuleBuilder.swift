//
//  ModuleBuilder.swift
//  MVP-education project
//
//  Created by Makarov_Maxim on 17.04.2022.
//

import Foundation
import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
}

class ModuleBuilder: Builder {
    static func createMainModule() -> UIViewController {
        let model = Person(firstName: "Max", lastName: "Makarov")
        let view = MainViewController()
        let presenter = MainPresenter(view: view, person: model)
        view.presenter = presenter
        return view
    }
    
    
}
