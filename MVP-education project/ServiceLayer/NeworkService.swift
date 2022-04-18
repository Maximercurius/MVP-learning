//
//  NeworkService.swift
//  MVP-education project
//
//  Created by Makarov_Maxim on 18.04.2022.
//

import Foundation

protocol NetworkSrviceProtocol {
    func getComments(comletion: @escaping(Result<[Comment]?, Error>) -> Void)
}
class NetworkService: NetworkSrviceProtocol {
    func getComments(comletion: @escaping (Result<[Comment]?, Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/comments"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                comletion(.failure(error))
                return
            }
            do {
                let obj = try JSONDecoder().decode([Comment].self, from: data!)
                comletion(.success(obj))
            } catch {
                comletion(.failure(error))
            }
        }.resume()
    }
}

