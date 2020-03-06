//
//  APIService.swift
//  TableViewTest
//
//  Created by shivank.mittal on 28/02/2020.
//  Copyright © 2020 shivank.mittal. All rights reserved.
//

import Foundation

class APIService {
    var movies :[Film] = []
    let movieArray = ["Joker","PK","Aladdin","Partner","It","Twilight","Hulk","Shrek","Parasite","Tintin","Avatar","Anastasia"]
    let urlString: String = "http://www.omdbapi.com/?t="
    let apiKey: String = "&apikey=af8b62df"
   
    func fetchUsers(completionHandler: @escaping ([Film]) -> Void){
        
        for movieName in movieArray {
            
            let finalString:String =  urlString + movieName + apiKey
            print(finalString)
            
            guard let url = URL(string: finalString) else {
                return
            }
            
            
            let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                if let data = data, let film = try?
                JSONDecoder().decode(Film.self, from: data) {
                    
                    self.movies.append(film)
                    let MArray = self.movies
                    completionHandler(MArray)
                }
                
            })
            task.resume()
        }
    }

}
