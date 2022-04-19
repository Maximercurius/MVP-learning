//
//  MainPresenterTest.swift
//  MVP-education projectTests
//
//  Created by Makarov_Maxim on 18.04.2022.
//

import XCTest

@testable import MVP_education_project

class MockView: MainViewProtocol {
    func succes() {
    }
    
    func failure(error: Error) {
    }
}

class MockNetworkService: NetworkSrviceProtocol {
    var comments: [Comment]!
    init() {}
    
    convenience init(comments: [Comment]?) {
        self.init()
        self.comments = comments
    }

    func getComments(comletion: @escaping (Result<[Comment]?, Error>) -> Void) {
        if let comments = comments {
            comletion(.success(comments))
        } else {
            let error = NSError(domain: "", code: 0, userInfo: nil)
            comletion(.failure(error))
        }
    }
    
    
}

class MainPresenterTest: XCTestCase {
    
    var view: MockView!
    var presenter: MainPresenter!
    var networkService: NetworkSrviceProtocol!
    var router: RouterProtocol!
    var comments = [Comment]()

    override func setUpWithError() throws {
        let nav = UINavigationController()
        let assembly = AssemblyModuleBuilder()
        router = Router(navigationController: nav, assemblyBuilder: assembly)

    }

    override func tearDownWithError() throws {
        view = nil
        networkService = nil
        presenter = nil
    }
    func testGetSuccesComments() {
        let comment = Comment(postId: 1, id: 2, name: "Foo", email: "Bar", body: "Baz")
        comments.append(comment)
        
        view = MockView()
        networkService = MockNetworkService(comments: [comment])
        presenter = MainPresenter(view: view, networkService: networkService, router: router)
        
        var catchComments: [Comment]?
        
        networkService.getComments { result in
            switch result {
            case.success(let comments):
                catchComments = comments
            case .failure(let error):
                print(error)
            }
        }
        XCTAssertNotEqual(catchComments?.count, 0)
        XCTAssertEqual(catchComments?.count, comments.count)
        
    }
    
    func testGetFailureComments() {
        let comment = Comment(postId: 1, id: 2, name: "Foo", email: "Bar", body: "Baz")
        comments.append(comment)
        
        view = MockView()
        networkService = MockNetworkService()
        presenter = MainPresenter(view: view, networkService: networkService, router: router)
        
        var catchError: Error?
        
        networkService.getComments { result in
            switch result {
            case.success(let comments):
                print(comments!)
            case .failure(let error):
                catchError = error
            }
        }
        XCTAssertNotNil(catchError)
        
    }

}
