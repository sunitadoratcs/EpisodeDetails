//
//  EpisodeDetailsViewController.swift
//  EpisodeDetails
//
//  Created by Sunita Dora on 8/25/20.
//  Copyright © 2020 Sunita Dora. All rights reserved.
//

import Foundation
import UIKit
class EpisodeDetailsViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var airDate: UILabel!
    @IBOutlet weak var created: UILabel!
    var episodeModel: Episode?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let episodeModel = episodeModel {
            name.text = "Name: \(episodeModel.name)"
            airDate.text = "AirDate: \(episodeModel.air_date)"
            created.text = "Created: \(episodeModel.created)"
        }
    }
}
