//
//  User.swift
//  TableViewTest
//
//  Created by shivank.mittal on 28/02/2020.
//  Copyright © 2020 shivank.mittal. All rights reserved.
//

import Foundation

class FilmResult:Codable{
    let results:[Film]
}



class Film:Codable
{

    let Title: String
    let Year: String
    let Genre:String
    let Director:String
    let Actors:String
    let Language:String
    let Poster:String
    let imdbRating:String
    let imdbID:String
    let BoxOffice:String
    let Production:String
    let Released:String
    let Plot:String
    
}
