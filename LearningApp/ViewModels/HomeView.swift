//
//  ContentView.swift
//  LearningApp
//
//  Created by Mark Holdsworth on 06/03/2023.
//

import SwiftUI

struct HomeView: View {
    
   @EnvironmentObject var model: ContentModel
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}