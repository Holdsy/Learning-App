//
//  ContentView.swift
//  LearningApp
//
//  Created by Mark Holdsworth on 06/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        ScrollView {
            
            LazyVStack {
                
                // Confirm that currentModule is set
                if model.currentModule != nil {
                
                    ForEach(0..<model.currentModule!.content.lessons.count) { index in
                        
                        NavigationLink(
                            destination:
                                ContentDetailView()
                                    .onAppear(perform: {
                                        model.beginLesson(index)
                                    }),
                            label: {
                                ContentViewRow(index: index)
                            })
                        
                    }
                }
            }
            .accentColor(.black)
            .padding()
            .navigationBarTitle("Learn \(model.currentModule?.category ?? "")")
            
        }
        
        
    }
}
