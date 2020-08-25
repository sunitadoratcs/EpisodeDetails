//
//  EpisodeModel.swift
//  EpisodeDetails
//
//  Created by Sunita Dora on 8/25/20.
//  Copyright © 2020 Sunita Dora. All rights reserved.
//

import Foundation

struct Episode: Codable {
    let id: Int
    let episode: String
    let name: String
    let air_date: String
    let created: String
}
