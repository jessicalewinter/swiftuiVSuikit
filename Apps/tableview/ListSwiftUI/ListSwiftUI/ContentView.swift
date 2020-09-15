//
//  ContentView.swift
//  ListSwiftUI
//
//  Created by Mateus Rodrigues on 28/02/20.
//  Copyright © 2020 Mateus Rodrigues. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let songs = Bundle.main.decode([Song].self, from: "songs.json")
    
    var body: some View {
        List(songs, id: \.name) { song in
            VStack(alignment: .leading) {
                Text(song.name).font(.body)
                Text(String(song.year)).font(.subheadline)
            }
        }
        .onAppear {
            print(self.songs.count)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
