//
//  MainPresenterInput.swift
//  HummerSystemTestStore
//
//  Created by Vladimir Izmaylov on 17.10.2022.
//

import Foundation

protocol MainPresenterInput: AnyObject {
    func attach(_ viewController: MainPresenterOutput)
    func viewDidLoad()
}
