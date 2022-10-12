//
//  messageCell.swift
//  TestTableViewWithSections
//
//  Created by ashraf on 12/10/2022.
//

import UIKit

class messageCell: UITableViewCell {

    @IBOutlet var personPic: UIImageView!
    @IBOutlet var person: UILabel!
    @IBOutlet var msg: UILabel!
    @IBOutlet var date: UILabel!
    
    func configureCell (personPic: String, person: String, msg: String, date: String) {

        self.personPic.image = UIImage(systemName: personPic)
        self.person.text = person
        self.msg.text = msg
        self.date.text = date
    }
}
