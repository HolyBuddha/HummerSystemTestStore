//
//  MainInteractorInput.swift
//  HummerSystemTestStore
//
//  Created by Vladimir Izmaylov on 17.10.2022.
//

import Foundation

protocol MainInteractorInput: AnyObject {
    func attach(_ output: MainInteractorOutput)
    func fetchData()
}
