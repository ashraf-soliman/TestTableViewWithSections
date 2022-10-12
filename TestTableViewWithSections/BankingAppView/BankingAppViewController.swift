//  BankingAppViewController.swift
//  TestTableViewWithSections
//  Created by ashraf on 12/10/2022.

import UIKit

class BankingAppViewController: UIViewController {

    @IBOutlet var HCollection: UICollectionView!
    @IBOutlet var messagesTable: UITableView!
    @IBOutlet var titleCollection: UICollectionView!
    
    var titles = ["Actions", "Channels", "Postcards", "Actions", "Channels", "Postcards", ]
    
    var cellImages = ["star", "firewall", "chart.bar", "bookmark", "star", "firewall", "chart.bar", "bookmark", ]
    var cellLabel = ["Text 1", "Text 2", "Text 3", "Text 4", "Text 5", "Text 6"]
    
    struct msg {
        var personPic: String
        var person: String
        var msg: String
        var date: String
    }
    var messageData: [msg] = [
        msg(personPic: "person", person: "Ahmed", msg: "Hello, transaction added", date: "10 Feb"),
        msg(personPic: "person.fill", person: "Ali", msg: "Hi!", date: "12 Mars"),
        msg(personPic: "person.circle", person: "Hany", msg: "Be Right Back", date: "17 Feb"),
        msg(personPic: "person.circle.fill", person: "Gamal", msg: "Hello", date: "10 Jan"),
        msg(personPic: "person", person: "Ahmed", msg: "Hello, transaction added", date: "10 Feb"),
        msg(personPic: "person.fill", person: "Ali", msg: "Hi!", date: "12 Mars"),
        msg(personPic: "person.circle", person: "Hany", msg: "Be Right Back", date: "17 Feb"),
        msg(personPic: "person", person: "Ahmed", msg: "Hello, transaction added", date: "10 Feb"),
        msg(personPic: "person.fill", person: "Ali", msg: "Hi!", date: "12 Mars"),
        msg(personPic: "person.circle", person: "Hany", msg: "Be Right Back", date: "17 Feb"),
        msg(personPic: "person.circle", person: "Hany", msg: "Be Right Back", date: "17 Feb"),
        msg(personPic: "person", person: "Ahmed", msg: "Hello, transaction added", date: "10 Feb"),
        msg(personPic: "person.fill", person: "Ali", msg: "Hi!", date: "12 Mars"),
        msg(personPic: "person.circle", person: "Hany", msg: "Be Right Back", date: "17 Feb"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleCollection.dataSource = self
        titleCollection.delegate = self
        
        HCollection.delegate = self
        HCollection.dataSource = self
        
        messagesTable.delegate = self
        messagesTable.dataSource = self
        
    }
    

}

extension BankingAppViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == titleCollection {
            return titles.count
        }
        return cellLabel.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == titleCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "titleCell", for: indexPath) as! titleCell
            cell.titleLabel.text = titles[indexPath.row]
            cell.layer.cornerRadius = 15
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hCell", for: indexPath) as! HCollectionViewCell
            cell.configureCell(imageName: cellImages[indexPath.row], label: cellLabel[indexPath.row])
            cell.backgroundColor = .systemBlue
            cell.layer.cornerRadius = 15
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == titleCollection {
            return CGSize(width: 170, height: 50)
        }
        return CGSize(width: 120, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 2, left: 10, bottom: 2, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
}


extension BankingAppViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "msgCell", for: indexPath) as! messageCell
        
        let cellData = messageData[indexPath.row]
        
        cell.configureCell(personPic: cellData.personPic, person: cellData.person, msg: cellData.msg, date: cellData.date)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
