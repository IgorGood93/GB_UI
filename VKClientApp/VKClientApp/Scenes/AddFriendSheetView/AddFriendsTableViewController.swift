//
//  AddFriendsTableViewController.swift
//  VKClientApp
//
//  Created by Игорь Гутчинов on 29.07.2021.
//

import UIKit

class AddFriendsTableViewController: UITableViewController {
    // MARK: - Properties
    private let addFriendsID = "AddFriendsTableID"
    
    // массив с доступными друзьями
    var friends = [FriendsInfoList(name: "Гамора", avatar: UIImage(named: "Gam_avatar_01"), type: "Зен-Хобери"),
                   FriendsInfoList(name: "Грут", avatar:  UIImage(named: "GR_avatar_01"), type: "Инопланетянин"),
                   FriendsInfoList(name: "Доктор Стрэндж", avatar: UIImage(named: "DrS_avatar_01"), type: "Человек"),
                   FriendsInfoList(name: "Дракс Разрушитель", avatar: UIImage(named: "DR_avatar_01"), type: "Инопланетянин"),
                   FriendsInfoList(name: "Железный человек", avatar: UIImage(named: "IM_avatar_01"), type: "Человек"),
                   FriendsInfoList(name: "Звёздный лорд", avatar: UIImage(named: "ZL_avatar_01"), type: "Человек"),
                   FriendsInfoList(name: "Капитан Америка", avatar: UIImage(named: "Cap_avatar_01"), type: "Человек"),
                   FriendsInfoList(name: "Ракета", avatar: UIImage(named: "R_avatar_01"), type: "Генетически усовершенствованный енот"),
                   FriendsInfoList(name: "Соколиный Глаз", avatar: UIImage(named: "SG_avatar_01"), type: "Человек"),
                   FriendsInfoList(name: "Тор", avatar: UIImage(named: "T_avatar_01"), type: "Асгардец"),
                   FriendsInfoList(name: "Халк", avatar: UIImage(named: "H_avatar_01"), type: "Человек"),
                   FriendsInfoList(name: "Человек Паук", avatar: UIImage(named: "CP_avatar_01"), type: "Человек"),
                   FriendsInfoList(name: "Человек-Муравей", avatar: UIImage(named: "CM_avatar_01"), type: "Человек")]
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let line = tableView.dequeueReusableCell(withIdentifier: addFriendsID, for: indexPath) as? FriendsTableViewLine else {
            fatalError("{ Message: Error in dequeue FriendsTableViewLine }")
        }
        line.friendsAvatar.image = friends[indexPath.row].avatar
        line.friendsNameID.text = friends[indexPath.row].name
        line.friendType.text = friends[indexPath.row].type
        return line
    }
    
}
