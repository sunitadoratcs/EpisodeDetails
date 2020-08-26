//
//  APIManager.swift
//  EpisodeDetails
//
//  Created by Sunita Dora on 8/25/20.
//  Copyright © 2020 Sunita Dora. All rights reserved.
//

import Foundation

struct APIManager {
    
    static func getEpisodeDetails(url: String, completion: @escaping (EpisodeResults) -> Void) {
        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard error == nil else {
                    return
                }
                do {
                    if let data = data {
                        let response = try JSONDecoder().decode(EpisodeResults.self, from: data)
                        completion(response)
                    }
                } catch let error {
                        //do error handling for parsing
                    print(error)
                    }
            }.resume()
        }
    }
}
