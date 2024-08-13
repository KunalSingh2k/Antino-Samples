//
//  FruitListProtocols.swift
//  ViperFruitList
//
//  Created by Kunal Kumar R on 29/07/24.
//

import Foundation

protocol FruitListViewProtocol {
    // Presenter -> View
    func showFruits(has fruits: [Fruit])
}

protocol FruitListPresenterProtocol {
    // View -> Presenter
    var interactor: FruitListInputInteractorProtocol? {get set}
    var view: FruitListViewProtocol? {get set}
    var wireFrame: FruitListWireFrameProtocol? {get set}
    
    func viewDidLoad()
}

protocol FruitListInputInteractorProtocol {
    var presenter: FruitListOutputInteractorProtocol? {get set}
    // Presenter -> Interactor
    func getFruitList()
}

protocol FruitListOutputInteractorProtocol {
    //Interactor -> Presenter
    func fruitListDidFetch(fruitList: [Fruit])
}

protocol FruitListWireFrameProtocol {
    static func createFruitListModule(fruitListRef: FruitListVC)
}
