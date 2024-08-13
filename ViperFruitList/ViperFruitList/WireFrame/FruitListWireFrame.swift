//
//  FruitListWireFrame.swift
//  ViperFruitList
//
//  Created by Kunal Kumar R on 29/07/24.
//

import Foundation

class FruitListWireFrame: FruitListWireFrameProtocol {
   static func createFruitListModule(fruitListRef: FruitListVC) {
        let presenter: FruitListPresenterProtocol & FruitListOutputInteractorProtocol = FruitListPresenter()
        fruitListRef.presenter = presenter
        fruitListRef.presenter?.wireFrame = FruitListWireFrame()
        fruitListRef.presenter?.view = fruitListRef 
        fruitListRef.presenter?.interactor = FruitListInteractor()
        fruitListRef.presenter?.interactor?.presenter = presenter
    }
}
