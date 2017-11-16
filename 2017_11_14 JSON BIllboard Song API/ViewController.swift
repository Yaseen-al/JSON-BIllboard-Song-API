//
//  ViewController.swift
//  2017_11_14 JSON BIllboard Song API
//
//  Created by C4Q on 11/14/17.
//  Copyright © 2017 Quark. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var myTableView: UITableView!
    var mySongs = [Song]()
    //Mark: UItableView : Required Methods
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let songSetup = mySongs[indexPath.row]
        guard let cell: UITableViewCell = myTableView.dequeueReusableCell(withIdentifier: "myCell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = songSetup.songName
        cell.detailTextLabel?.text = "Artist:\(songSetup.artist), SongId: \(songSetup.songId)"
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySongs.count
    }
    //access the JSON and convert it to URL and then get your Data from it 
    func loadData() {
        if let path = Bundle.main.path(forResource: "Rock", ofType: "json"){
            let myURL = URL(fileURLWithPath: path)
            if let data = try? Data(contentsOf: myURL){
                self.mySongs = Song.gitData(from: data)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        loadData()
        print(mySongs[3].songName)
    }
}

