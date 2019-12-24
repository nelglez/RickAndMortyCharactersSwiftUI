//
//  DetailView.swift
//  StrangerThings
//
//  Created by Nelson Gonzalez on 12/24/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    var result: Results
    var body: some View {
        VStack {
            WebImage(url: URL(string: result.image)).resizable() // Resizable like SwiftUI.Image
            .placeholder(Image(systemName: "image")) // Placeholder Image
            // Supports ViewBuilder as well
            .placeholder {
                Rectangle().foregroundColor(.gray)
            }
            .animated() // Supports Animated Image
            .indicator(.activity) // Activity Indicator
            .animation(.easeInOut(duration: 0.5)) // Animation Duration
            .transition(.fade) // Fade Transition
            .scaledToFit()
            .frame(width: 300, height: 300, alignment: .center)
                .clipShape(Circle()).shadow(color: .gray, radius: 10, x: 1, y: 1)
            
            Text(result.name).font(.largeTitle)
            HStack {
                Text("Species:")
            Text(result.species).font(.title)
            }
            HStack {
                Text("Status:")
            Text(result.status)
            }
            Spacer()
        }
    }
    
    //MARK: to clear image cache
    func reloadCache() {
        SDImageCache.shared.clearMemory()
        SDImageCache.shared.clearDisk(onCompletion: nil)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(result: Results(id: 1, name: "Test", status: "Alive", species: "Computer", image: "img"))
    }
}
