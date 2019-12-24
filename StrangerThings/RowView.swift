//
//  RowView.swift
//  StrangerThings
//
//  Created by Nelson Gonzalez on 12/23/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct RowView: View {
    var result: Results
    
    
    var body: some View {
        ZStack {
            Rectangle().fill(Color.white).cornerRadius(10).shadow(color: .gray, radius: 5, x: 1, y: 1)
        HStack {
           // Image(uiImage: UIImage(data: data) ?? UIImage(named: "image")!).resizable().frame(width: 100, height: 100)
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
                   .frame(width: 100, height: 100, alignment: .center)
            
            Spacer()
            Text(result.name).font(.title)
         
            }.padding()
    }
    }
//    func loadImages(url: String) {
//        guard let url = URL(string: url) else { return }
//        URLSession.shared.dataTask(with: url) { (data, _, error) in
//            if let error = error {
//                print(error.localizedDescription)
//                return
//            }
//            guard let data = data else { return }
//            DispatchQueue.main.async {
//                self.data = data
//            }
//
//        }.resume()
//    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(result: Results(id: 1, name: "Test", status: "Alive", species: "Computer", image: "img"))
    }
}
