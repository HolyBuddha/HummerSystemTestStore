//
//  MainInteractorOutput.swift
//  HummerSystemTestStore
//
//  Created by Vladimir Izmaylov on 17.10.2022.
//

import Foundation

protocol MainInteractorOutput: AnyObject {
    func catalogSuccess(catalog: FakeStore)
}
