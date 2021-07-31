//
//  GroupTableViewController.swift
//  VKClientApp
//
//  Created by Игорь Гутчинов on 31.07.2021.
//

import UIKit

class GroupTableViewController: UITableViewController {
    //    MARK: - Outlets
    //    Таблица добавленных групп
    @IBOutlet var groupTableView: UITableView!
    
    
    
    //    MARK: - Properties
    //    Идентификатор ячейки
    private var lineUD = "GroupTableViewCell"
    //    Массив со списком добавленных групп
        private var group = [Group]()
    
    //    MARK: - Functions
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return group.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let line  = tableView.dequeueReusableCell(withIdentifier: lineUD, for: indexPath) as? GroupTableViewCell else {
            fatalError("{ Message: Error in dequeue GroupTableViewCell }")
        }
        line.avatarGroup.image = group[indexPath.row].image
        line.nameGroup.text = group[indexPath.row].name
        line.statusGroup.text = group[indexPath.row].date
        return line
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            group.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        default:
            return
        }
    }
    
    @IBAction private func BackFromAvailableScreen(with segue: UIStoryboardSegue) {
        guard let addGroupVC = segue.source as? AddGroupTableViewController,
              let indexPath = addGroupVC.tableView.indexPathForSelectedRow else { return }
        let newGroup = addGroupVC.group[indexPath.row]

        if !group.contains(newGroup) {
            group.append(newGroup)
            groupTableView.reloadData()
        } else { return }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
 
}
