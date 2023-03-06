//
//  ContentModel.swift
//  LearningApp
//
//  Created by Mark Holdsworth on 06/03/2023.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    var styleData: Data?
    
    init() {
        
        getLocalData()
        
    }
    
    func getLocalData() {
        
        // get a URL to the json file
        
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension:"json")
        
        
        do {
            // Read the file into a data object
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            // Try to decode the json into an array of modules
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            // Assign parsed modules to modules property
            self.modules = modules
            
        }
        catch {
            
             print("Could't parse local data")
        }
        
        
        // Parse the style data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
        let styleData = try Data(contentsOf: styleUrl!)
        
        self.styleData = styleData
        
       
            
            
        }
        catch {
            
            print("Could't parse style data")
            
        }
        
    }
    
    }
