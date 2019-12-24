//
//  Character.swift
//  StrangerThings
//
//  Created by Nelson Gonzalez on 12/23/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import Foundation

struct Character: Codable {
    let results: [Results]
}
struct Results: Codable, Identifiable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let image: String
}
