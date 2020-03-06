//
//  DetailViewController.swift
//  TableViewTest
//
//  Created by shivank.mittal on 28/02/2020.
//  Copyright © 2020 shivank.mittal. All rights reserved.//

import UIKit

class DetailViewController: UIViewController {
    
    var film : Film?
   
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var ReleasedLable: UILabel!
    @IBOutlet weak var IMDBRatingLable: UILabel!
    @IBOutlet weak var DirectorLable: UILabel!
    @IBOutlet weak var LanguageLable: UILabel!
    @IBOutlet weak var Plot: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        populateInfo()
    }
    
    func populateInfo() {
        guard film != nil else {
            return
        }
        
        titleLable.text = film?.Title
        IMDBRatingLable.text = film?.imdbRating
        DirectorLable.text = film?.Director
        LanguageLable.text = film?.Language
        ReleasedLable.text = film?.Released
        Plot.text = film?.Plot
        setImageforDetailedView(urlString: film?.Poster ?? "")
        
    }
    
    func setImageforDetailedView(urlString : String){
        let url = URL(string: urlString)
        let data = try? Data(contentsOf: (url)!)
        posterImage.image = UIImage(data: data!)
    }
}
