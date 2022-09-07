//
//  ContentView.swift
//  Infoday
//
//  Created by f2501029 on 7/9/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            DeptView().tabItem {
                Image(systemName: "calendar.circle.fill")
                Text("Events")
            }
            MapView().tabItem {
                Image(systemName: "map.fill")
                Text("Map")
            }
            InfoView().tabItem {
                Image(systemName: "info.circle.fill")
                    Text("Info")
}
                
            }
        }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

