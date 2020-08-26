//
//  EpisodeResults.swift
//  EpisodeDetails
//
//  Created by Sunita Dora on 8/25/20.
//  Copyright © 2020 Sunita Dora. All rights reserved.
//

import Foundation

struct EpisodeResults: Codable {
    let results: [Episode]
    let info: Info
}

struct Info: Codable {
    let pages: Int
    let count: Int
    let next: String?
    let prev: String?
}
