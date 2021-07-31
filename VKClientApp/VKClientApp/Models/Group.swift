//
//  Group.swift
//  VKClientApp
//
//  Created by Игорь Гутчинов on 31.07.2021.
//

import UIKit

struct Group {
    let name: String
    let image: UIImage?
    let date: String
}


extension Group: Equatable {
    static func == (lhs: Group, rhs: Group) -> Bool {
        return lhs.name == rhs.name
    }
}
