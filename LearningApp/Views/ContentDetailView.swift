//
//  ContentDetailView.swift
//  LearningApp
//
//  Created by Mark Holdsworth on 07/03/2023.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        
        VStack {
            // Only show video if we get a valid URL
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
            }
            
            // Description
            CodeTextView()
            
            // Show next lesson button, only if there is a next lesson
            if model.hasNextLesson() {
                
                Button(action: {
                    
                    // Advance the lesson
                    model.nextLesson()
                    
                }, label: {
                    
                    ZStack {
                    
                        RectangleCard(color: Color.green)
                            .frame(height:48)
                         
                        
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                })
            }
            else {
         // Show the completed button insted
                
                Button(action: {
                    
                    // Take the user back to the home view
                    model.currentContentSelected = nil
                    
                }, label: {
                    
                    ZStack {
                    
                        RectangleCard(color: Color.green)
                            .frame(height:48)
                          
                        
                        Text("Complete")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                })
            }
        }
            .padding()
            .navigationTitle(lesson?.title ?? "")
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
