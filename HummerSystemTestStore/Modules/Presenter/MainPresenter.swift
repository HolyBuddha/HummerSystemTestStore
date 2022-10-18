//
//  MainPresenter.swift
//  HummerSystemTestStore
//
//  Created by Vladimir Izmaylov on 17.10.2022.
//

import Foundation

class MainPresenter: MainPresenterInput {
    
    private weak var viewController: MainPresenterOutput?
    let interactor: MainInteractorInput
    init(_ interactor: MainInteractorInput) {
        self.interactor = interactor
    }
    
    func attach(_ viewController: MainPresenterOutput) {
        self.viewController = viewController
        interactor.attach(self)
    }
    
    func viewDidLoad() {
        viewController?.configureUi()
        viewController?.configureNavigationBar()
        interactor.fetchData()
    }

}

extension MainPresenter: MainInteractorOutput {
    func menuSuccess(_ menu: FakeStore) {
        let electronics = menu.filter({$0.category == Category.electronics})
        let jewelery = menu.filter({$0.category == Category.jewelery})
        let mensClothing = menu.filter({$0.category == Category.mensClothing})
        let womensClothing = menu.filter({$0.category == Category.womensClothing})
        let finalCatalog: FakeStore = electronics + jewelery + mensClothing + womensClothing
        viewController?.didReceiveMainData(catalog: finalCatalog)
    }
}
