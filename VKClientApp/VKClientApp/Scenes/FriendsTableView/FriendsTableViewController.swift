//
//  FriendsTableViewController.swift
//  VKClientApp
//
//  Created by Игорь Гутчинов on 29.07.2021.
//

import UIKit

class FriendsTableViewController: UITableViewController {
//    MARK: - Outlets
//    Таблица друзей
    @IBOutlet var friendsTableView: UITableView!
    
//    MARK: - Properties
//    Идентификатор ячейки
    private var lineUD = "FriendsTableViewLine"
//    Массив со списком друзей
    private var friends = [FriendsInfoList]()
    
//    MARK: - Functions
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let line  = tableView.dequeueReusableCell(withIdentifier: lineUD, for: indexPath) as? FriendsTableViewLine else {
            fatalError("{ Message: Error in dequeue FriendsTableViewLine }")
        }
        line.friendsAvatar.image = friends[indexPath.row].avatar
        line.friendsNameID.text = friends[indexPath.row].name
        line.friendType.text = friends[indexPath.row].type
        return line
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            friends.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        default:
            return
        }
    }
    
    @IBAction private func goBackFromAvailableScreen(with segue: UIStoryboardSegue) {
        guard let addFriendVC = segue.source as? AddFriendsTableViewController,
              let indexPath = addFriendVC.tableView.indexPathForSelectedRow else { return }
        let newFriend = addFriendVC.friends[indexPath.row]

        if !friends.contains(newFriend) {
            friends.append(newFriend)
            friendsTableView.reloadData()
        } else { return }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
