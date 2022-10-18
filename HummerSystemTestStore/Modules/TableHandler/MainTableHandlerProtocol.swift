//
//  MainTableHandlerProtocol.swift
//  HummerSystemTestStore
//
//  Created by Vladimir Izmaylov on 17.10.2022.
//

import UIKit

protocol MainTableHandlerProtocol {
    func attach(_ tableView: UITableView)
    func setData(_ data: FakeStore)
}
