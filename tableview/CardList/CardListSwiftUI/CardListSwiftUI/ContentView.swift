//
//  ContentView.swift
//  CardListSwiftUI
//
//  Created by Mateus Rodrigues on 06/03/20.
//  Copyright © 2020 Mateus Rodrigues. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let albuns = Bundle.main.decode([Album].self, from: "albuns.json")
    
    var body: some View {
        List(albuns, id: \.name) { album in
            VStack(alignment: .center, spacing: 2) {
                Image(album.cover)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .border(Color(UIColor.lightGray), width: 1)
                Text(album.name)
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity, alignment: .center)
                Text(String(album.year))
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding(.top, 10)
            .padding(.bottom, 10)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .aspectRatio(1, contentMode: .fit)
                    .shadow(color: Color.black.opacity(0.25), radius: 3, x: 0, y: 0)
            )
            .frame(height: 250, alignment: .center)
           
        }
        .onAppear {
            print(self.albuns.count)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
