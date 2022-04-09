//
//  HomeScreen.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-01.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        TabView {
            ListingScreen()
                .tabItem {
                    VStack{
                        Image(systemName: "list.bullet")
                        Text("Toys")
                    }
                }
            
            PostScreen()
                .tabItem {
                    VStack{
                        Image(systemName: "plus")
                        Text("Post")
                    }
                }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
