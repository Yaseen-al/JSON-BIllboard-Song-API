//
//  SongData.swift
//  2017_11_14 JSON BIllboard Song API
//
//  Created by C4Q on 11/14/17.
//  Copyright © 2017 Quark. All rights reserved.
//

import Foundation


class Song {
    var songName:String
    var artist: String
    var songId: Int
    
    init(songName:String, artist: String, songId: Int) {
        self.songName = songName
        self.artist = artist
        self.songId = songId
    }
    convenience init(fom dict: [String: Any]) {
        let artist = dict["display_artist"] as? String ?? "Unknown Artist"
        print(artist)
        let songName = dict["song_name"] as? String ?? "Unknown Song"
        print(songName)
        let songId = dict["song_id"] as? String ?? ""
        print(songId)
        self.init(songName: songName, artist: artist, songId: Int(songId)!)
    }
    
    
    //Setup your data first and then use it in the convenience init
    static func gitData(from data: Data)-> [Song]{
        var outputSongs = [Song]()
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            guard let jsonArray = json as? [Any] else {
                return []
            }
            for song in jsonArray{
                if let safeSong = song as? [String: Any] {
                    
                    //here you will need a convenience init to create your objects
                    outputSongs.append(Song(fom: safeSong))
                }
            }
            
        } catch  {
            print("error")
        }
        
        return outputSongs
    }
    
}
