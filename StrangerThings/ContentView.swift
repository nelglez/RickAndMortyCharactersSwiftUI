//
//  ContentView.swift
//  StrangerThings
//
//  Created by Nelson Gonzalez on 12/23/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @ObservedObject var characterController = CharacterController()
    @State private var isAnimating: Bool = true
    
    var body: some View {
        NavigationView {
            
            List(characterController.results, id: \.id) { result in
                if self.isAnimating {
                    ActivityIndicator(isAnimating: self.$isAnimating)
                } else {
                    NavigationLink(destination: DetailView(result: result)) {
                        
                        RowView(result: result)
                    }
                }
            }.onAppear {
                
                self.characterController.fetchEpisodes(onSuccess: {
                    print("Success")
                    
                    self.isAnimating = false
                }) { (error) in
                    if let error = error {
                        print(error.localizedDescription)
                        
                        self.isAnimating = false
                        return
                    }
                }
                
            }.navigationBarTitle("Characters")
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
