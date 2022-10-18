//
//  NetworkManagerProtocol.swift
//  HummerSystemTestStore
//
//  Created by Vladimir Izmaylov on 17.10.2022.
//

import Foundation

protocol FakeApiProtocol {
    func fecthMenu(completion: @escaping(FakeStore) -> Void)
}
