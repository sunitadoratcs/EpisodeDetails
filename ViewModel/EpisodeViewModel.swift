//
//  EpisodeViewModel.swift
//  EpisodeDetails
//
//  Created by Sunita Dora on 8/25/20.
//  Copyright © 2020 Sunita Dora. All rights reserved.
//

import Foundation

class EpisodeViewModel {
    var urlString: String?
    var episodeResults: [Episode]?
    
    func getEpisodes(completion: @escaping () -> Void) {
        if let urlString = urlString {
            APIManager.getEpisodeDetails(url: urlString) { (results) in
                self.episodeResults = results.results
                completion()
            }
        }
    }
}
