//
//  MainAssembler.swift
//  HummerSystemTestStore
//
//  Created by Vladimir Izmaylov on 17.10.2022.
//

import UIKit

class MainAssembler {
    static func createModule() -> UIViewController {
        let viewController = MainViewController()
        let interactor = MainInteractor()
        let presenter = MainPresenter(interactor)
        let tableHandler = MainTableHandler()
        viewController.presenter = presenter
        viewController.tableHandler = tableHandler
        tableHandler.delegate = viewController
        viewController.header.delegate = tableHandler
        return viewController
    }
}
