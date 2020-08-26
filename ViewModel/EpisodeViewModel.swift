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
    var episodeInfo: Info?
    
    func getEpisodes(completion: @escaping () -> Void) {
        if let urlString = urlString {
            APIManager.getEpisodeDetails(url: urlString) { (results) in
                if let _ = self.episodeResults {
                    self.episodeResults?.append(contentsOf: results.results)
                } else {
                    self.episodeResults = results.results
                }
                self.episodeInfo = results.info
                completion()
            }
        }
    }
}
