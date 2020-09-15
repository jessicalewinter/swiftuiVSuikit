//
//  ViewController.swift
//  CardListUIKit
//
//  Created by Mateus Rodrigues on 06/03/20.
//  Copyright © 2020 Mateus Rodrigues. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView = UITableView(frame: .zero)
    
    let albuns = Bundle.main.decode([Album].self, from: "albuns.json")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tableView.register(AlbumCell.self, forCellReuseIdentifier: "album-cell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(albuns.count)
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albuns.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "album-cell", for: indexPath) as! AlbumCell
        let album = albuns[indexPath.row]
        cell.coverImageView.image = UIImage(named: album.cover)
        cell.titleLabel.text = album.name
        cell.yearLabel.text = String(album.year)
        return cell
    }

}

