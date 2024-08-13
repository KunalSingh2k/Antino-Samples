//
//  Petition.swift
//  WhiteHousePetitions
//
//  Created by Kunal Kumar R on 23/07/24.
//

import Foundation

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}
