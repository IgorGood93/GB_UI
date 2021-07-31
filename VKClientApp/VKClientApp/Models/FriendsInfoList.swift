//
//  FriendsInfoList.swift
//  VKClientApp
//
//  Created by Игорь Гутчинов on 29.07.2021.
//

import UIKit

struct FriendsInfoList {
    let name: String
    let avatar: UIImage?
    let type: String
}


extension FriendsInfoList: Equatable {
    static func == (lhs: FriendsInfoList, rhs: FriendsInfoList) -> Bool {
        return lhs.name == rhs.name
    }
}
