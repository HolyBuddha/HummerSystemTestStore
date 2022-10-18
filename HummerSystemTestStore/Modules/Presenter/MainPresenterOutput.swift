//
//  MainPresenterOutput.swift
//  HummerSystemTestStore
//
//  Created by Vladimir Izmaylov on 17.10.2022.
//

import Foundation

protocol MainPresenterOutput: AnyObject {
    func configureUi()
    func configureNavigationBar()
    func didReceiveMainData(catalog: FakeStore)
}
