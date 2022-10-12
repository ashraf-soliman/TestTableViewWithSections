//
//  HCollectionViewCell.swift
//  TestTableViewWithSections
//
//  Created by ashraf on 12/10/2022.
//

import UIKit

class HCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var cellImageView: UIImageView!
    @IBOutlet var cellLabel: UILabel!
    
    
    func configureCell (imageName: String, label: String) {
        self.cellImageView.image = UIImage(systemName: imageName)
        self.cellLabel.text = label
    }
}
