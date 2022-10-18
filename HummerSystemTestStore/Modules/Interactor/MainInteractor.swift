//
//  MainInteractor.swift
//  HummerSystemTestStore
//
//  Created by Vladimir Izmaylov on 17.10.2022.
//

import Foundation

class MainInteractor: MainInteractorInput {
    
    private let fakeApi: FakeApiProtocol
    private weak var output: MainInteractorOutput?
    
    init(fakeApi: FakeApiProtocol = FakeApi()) {
        self.fakeApi = fakeApi
    }
    
    func attach(_ output: MainInteractorOutput) {
        self.output = output
    }
    
    func fetchData() {
        fakeApi.fecthCatalog{ model in
            self.output?.catalogSuccess(catalog: model)
        }
    }
}
