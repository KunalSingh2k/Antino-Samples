//
//  FruitListPresenter.swift
//  ViperFruitList
//
//  Created by Kunal Kumar R on 29/07/24.
//

import Foundation

class FruitListPresenter: FruitListPresenterProtocol {
    var wireFrame: FruitListWireFrameProtocol?
    var interactor: FruitListInputInteractorProtocol?
    var view: FruitListViewProtocol?
    
    func viewDidLoad() {
        self.loadFruitsList()
    }
    
    func loadFruitsList() {
        interactor?.getFruitList()
    }
}

extension FruitListPresenter: FruitListOutputInteractorProtocol {
    func fruitListDidFetch(fruitList: [Fruit]) {
        view?.showFruits(has: fruitList)
    }
}
