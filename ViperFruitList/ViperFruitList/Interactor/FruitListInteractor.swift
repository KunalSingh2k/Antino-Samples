//
//  FruitListInteractor.swift
//  ViperFruitList
//
//  Created by Kunal Kumar R on 29/07/24.
//

import Foundation

class FruitListInteractor: FruitListInputInteractorProtocol {
    var presenter: FruitListOutputInteractorProtocol?
    
    func getFruitList() {
        presenter?.fruitListDidFetch(fruitList: fetchFruits())
    }
    
    func fetchFruits() -> [Fruit] {
        var fruitList = [Fruit]()
        let fruitDetail = Common.generateDataList()
        for fruit in fruitDetail {
            fruitList.append(Fruit(attributes: fruit))
        }
        return fruitList
    }
}
