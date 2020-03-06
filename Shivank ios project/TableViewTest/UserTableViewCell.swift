//
//  UserTableViewCell.swift
//  TableViewTest
//
//  Created by shivank.mittal on 28/02/2020.
//  Copyright © 2020 shivank.mittal. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var boxOfficeCollection: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        posterImageView.layer.cornerRadius = posterImageView.frame.height / 2
        posterImageView.clipsToBounds = true
    }
    
    func setImageFor(urlString: String) {
        let url = URL(string: urlString)
        let data = try? Data(contentsOf: (url)!)
        posterImageView.image = UIImage(data: data!)
    }
}
