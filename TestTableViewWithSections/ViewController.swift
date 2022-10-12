//
//  ViewController.swift
//  TestTableViewWithSections
//
//  Created by ashraf on 11/10/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var table: UITableView!
    
    var sections = ["Section A", "Section B"]
    var rows = [["Row A-1", "Row A-2"],["Row B-1", "Row B-2"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        
//        sections.removeAll()
//        rows.removeAll()
//        if sections.count == 0 {
//            table.isHidden = true
//        }
        
    }
}

    

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel!.text = rows[indexPath.section][indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "End of Section"
    }
    
}
