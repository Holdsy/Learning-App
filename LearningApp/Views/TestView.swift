//
//  TestView.swift
//  LearningApp
//
//  Created by Mark Holdsworth on 08/03/2023.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model:ContentModel
    @State var selectedAnswerIndex:Int?
    @State var submitted = false
    @State var numCorrect = 0
  
    
    var body: some View {
        
        if model.currentQuestion != nil {
            
            VStack(alignment: .leading) {
                // Question number
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                    .padding(.leading, 20)
                
                // Question
                CodeTextView()
                    .padding(.horizontal, 20)
                
                // Answers
                ScrollView {
                    VStack {
                        ForEach (0..<model.currentQuestion!.answers.count, id: \.self) { index in
                            
                            Button {
                                // Track the selectedIndex
                                selectedAnswerIndex = index
                            } label: {

                                ZStack {
                                    
                                    
                                    if submitted == false {
                                        RectangleCard(color: index == selectedAnswerIndex ? .gray : .white)
                                            .frame(height: 48)
                                    }
                                    else {
                                        // Answer has been submitted
                                        if index == selectedAnswerIndex &&
                                            index == model.currentQuestion!.correctIndex {
                                            
                                            // User has selected the right answer
                                            // Show a green background
                                            RectangleCard(color: .green)
                                                .frame( height: 48)
                                        }
                                        else if index == selectedAnswerIndex &&
                                                    index != model.currentQuestion!.correctIndex {
                                            
                                            
                                            // User has selected the wrong answer
                                            // Show a red background
                                            RectangleCard(color: .red)
                                                .frame( height: 48)
                                        }
                                        else if index == model.currentQuestion?.correctIndex {
                                            
                                            // User has selected the right answer
                                            // Show a green background
                                            RectangleCard(color: .green)
                                                .frame( height: 48)
                                        }
                                        else {
                                            RectangleCard(color: .white)
                                                .frame(height: 48)
                                            
                                        }
                                        
                                    }
                                        
                                        Text(model.currentQuestion!.answers[index])
                                    
                                    
                                }
                                
                            }
                            .disabled(submitted)
                        }
                       
                    }
                    .foregroundColor(.black)
                    .padding()
                }
                
                
                // Submit Button
                Button {
                    
                    // Check if answer has been submitted
                    if submitted == true {
                        // Answer has already been submitted move to next question
                        model.nextQuestion()
                        
                        // Reset properties
                        submitted = false
                        selectedAnswerIndex = nil
                        
                        
                    }
                    else {
                        // Submit the answer
                        
                        // Change submitted state to true
                        
                        submitted = true
                        
                        // Check the answer and increment the counter if correct
                        
                        if selectedAnswerIndex == model.currentQuestion!.correctIndex {
                            numCorrect += 1
                        }
                        
                    }
                    
                    
                    
                    
                } label: {
                    ZStack  {
                        
                        RectangleCard(color: .green)
                            .frame(height: 48)
                        
                        Text(buttonText)
                            .foregroundColor(.white)
                            .bold()
                        
                    }
                    .padding()
                }
                .disabled(selectedAnswerIndex == nil)
            }
            .navigationBarTitle("\(model.currentModule?.category ?? "") Test")
            
        }
        else {
            // If current question is nil, we show the result view
            TestResultView(numCorrect: numCorrect)
            
        }
        
        
    }
    
    var buttonText:String {
        
        // Check if answer has been submitted
        
        if submitted == true {
            if model.currentQuestionIndex + 1 == model.currentModule!.test.questions.count {
                // This is the last question
                return "Finish"
            }
            else {
                // There is another question
                return "Next"
            }
        }
            
        else {
            return "Submit"
            
        }
    }
    
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
