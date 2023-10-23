//
//  SUI_9App.swift
//  SUI-9
//
//  Created by  Pavel Nepogodin on 23.10.23.
//

import SwiftUI

@main
struct SUI_9App: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        Label("tutorial", systemImage: "star.fill")
                    }
                
                AlternativeContentView()
                    .tabItem {
                        Label("alternative", systemImage: "star.fill")
                    }
            }
        }
    }
}
