//
//  NetworkManager.swift
//  HummerSystemTestStore
//
//  Created by Vladimir Izmaylov on 17.10.2022.
//

import Foundation

class FakeApi: FakeApiProtocol {
    
    let fakeStoreUrl = "https://fakestoreapi.com/products"
    
    func fecthMenu(completion: @escaping (FakeStore) -> Void) {
        guard let url = URL(string: fakeStoreUrl ) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let storeData = try JSONDecoder().decode(FakeStore.self, from: data)
                DispatchQueue.main.async {
                    completion(storeData)
                }
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
}
