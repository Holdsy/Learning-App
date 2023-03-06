//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Mark Holdsworth on 06/03/2023.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
