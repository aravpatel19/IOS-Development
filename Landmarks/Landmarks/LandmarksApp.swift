//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Arav Patel on 3/7/23.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
