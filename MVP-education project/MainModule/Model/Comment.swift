//
//  Person.swift
//  MVP-education project
//
//  Created by Makarov_Maxim on 17.04.2022.
//

import Foundation

struct Comment: Decodable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
