//
//  SwiftUITutorialsApp.swift
//  SwiftUITutorials
//
//  Created by 이주경 on 2022/09/16.
//

import SwiftUI

// @main : SwiftUI의 진입점을 나타내기 위함! 두개 이상시 컴파일러 오류 발생
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
