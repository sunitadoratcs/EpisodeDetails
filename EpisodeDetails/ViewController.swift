//
//  ViewController.swift
//  EpisodeDetails
//
//  Created by Sunita Dora on 8/25/20.
//  Copyright © 2020 Sunita Dora. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var episodeTableView: UITableView!
    let viewModel: EpisodeViewModel = EpisodeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        episodeTableView.dataSource = self
        episodeTableView.delegate = self
        viewModel.urlString = "https://rickandmortyapi.com/api/episode"
        viewModel.getEpisodes {
            DispatchQueue.main.async { [weak self] in
                self?.episodeTableView.reloadData()
            }
            // Do any additional setup after loading the view.
        }
    }
    
    //MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.episodeResults?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let episode = viewModel.episodeResults?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell", for: indexPath)
        cell.textLabel?.text = episode?.name
        cell.backgroundColor = indexPath.row%2 == 0 ? UIColor.darkGray : UIColor.lightGray
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let episodeInfo = viewModel.episodeInfo, let episodeResults = viewModel.episodeResults, indexPath.row < episodeInfo.count - 1, indexPath.row == episodeResults.count - 1 {
            viewModel.urlString = episodeInfo.next
            viewModel.getEpisodes {
                DispatchQueue.main.async { [weak self] in
                    self?.episodeTableView.reloadData()
                }
                // Do any additional setup after loading the view.
            }
        }
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        let episode = viewModel.episodeResults?[indexPath.row]
        performSegue(withIdentifier: "ShowEpisodeDetailsSegue", sender: episode)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is EpisodeDetailsViewController
        {
            let detailedViewController = segue.destination as? EpisodeDetailsViewController
            detailedViewController?.episodeModel = sender as? Episode
            
        }
    }
    
}

