//
//  TableCell.swift
//  Movies
//
//  Created by Ahmed Refaat on 9/12/19.
//  Copyright © 2019 Ahmed Elmoughazy. All rights reserved.
//

import UIKit
import SDWebImage

class TableCell: UITableViewCell {
   
    @IBOutlet private weak var profileImage: UIImageView!
    
    @IBOutlet private weak var nameLabel: UILabel!
    
    @IBOutlet private weak var popLabel: UILabel!
    
    @IBOutlet private weak var department: UILabel!
    
    func configure(indexPathRow: Int, person: Person){
        nameLabel.text = person.name
        department.text = person.knownForDepartment
        popLabel.text = String(describing: person.popularity!)
        
        guard let profilePath = person.profilePath else {
            profileImage.sd_setImage(with: URL(string:" "), placeholderImage: UIImage(named: "person"))
            return
        }
        profileImage.sd_setImage(with: URL(string:
            "https://image.tmdb.org/t/p/w500/"+profilePath), placeholderImage: UIImage(named: "person"))
    }
}
