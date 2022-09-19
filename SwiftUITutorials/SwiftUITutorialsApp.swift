//
//  SwiftUITutorialsApp.swift
//  SwiftUITutorials
//
//  Created by 이주경 on 2022/09/16.
//

import SwiftUI

@main
struct SwiftUITutorialsApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
