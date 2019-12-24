//
//  EpisodeController.swift
//  StrangerThings
//
//  Created by Nelson Gonzalez on 12/23/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import Foundation

class CharacterController: ObservableObject {
    @Published private(set) var results: [Results] = []
    
    
   private let baseUrl = URL(string: "https://rickandmortyapi.com/api/character/")!
    
    
    func fetchEpisodes(onSuccess: @escaping() -> Void, completion: @escaping(Error?) -> Void) {
        URLSession.shared.dataTask(with: baseUrl) { (data, _, error) in
            if let error = error {
                completion(error)
                return
            }
            
            guard let data = data else {
                completion(error)
                return
            }
            
            let decoder = JSONDecoder()
            
            
            do {
                let result = try decoder.decode(Character.self, from: data).results
                //print(result)
                DispatchQueue.main.async {
                    
                    self.results = result
                   
                    onSuccess()
                }
            } catch {
                completion(error)
            }
            
        }.resume()
    }
}
