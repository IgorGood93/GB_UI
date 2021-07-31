//
//  AddGroupTableViewController.swift
//  VKClientApp
//
//  Created by Игорь Гутчинов on 31.07.2021.
//

import UIKit

class AddGroupTableViewController: UITableViewController {
    // MARK: - Properties
    private let addGroupID = "AddGroupTableID"
    
    // массив с доступными друзьями
    var group = [Group(name: "Мстители", image: UIImage(named: "Avengers"), date: "2012"),
                 Group(name: "Щит", image:  UIImage(named: "Shield"), date: "1960")]
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return group.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cells = tableView.dequeueReusableCell(withIdentifier: addGroupID, for: indexPath) as? GroupTableViewCell else {
            fatalError("{ Message: Error in dequeue GroupTableViewCell }")
        }
        cells.avatarGroup.image = group[indexPath.row].image
        cells.nameGroup.text = group[indexPath.row].name
        cells.statusGroup.text = group[indexPath.row].date
        return cells
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
