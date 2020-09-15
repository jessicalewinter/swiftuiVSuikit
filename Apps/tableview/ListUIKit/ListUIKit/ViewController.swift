//
//  ViewController.swift
//  ListUIKit
//
//  Created by Mateus Rodrigues on 28/02/20.
//  Copyright © 2020 Mateus Rodrigues. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView = UITableView(frame: .zero)
    
    let songs = Bundle.main.decode([Song].self, from: "songs.json")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tableView.register(SongCell.self, forCellReuseIdentifier: "song-cell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(songs.count)
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "song-cell", for: indexPath) as! SongCell
        let song = songs[indexPath.row]
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = String(song.year)
        return cell
    }
    
    
}

