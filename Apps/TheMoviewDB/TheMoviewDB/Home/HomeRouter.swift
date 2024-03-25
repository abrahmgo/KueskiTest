//
//  HomeRouter.swift
//  TheMoviewDB
//
//  Created by Andrés Bonilla Gómez on 25/03/24.
//

import UIKit

class HomeRouter: HomeRouterType {
    weak var view: UIViewController?
    
    func goToNextView() {
        let viewController = UIViewController()
        view?.navigationController?.pushViewController(viewController, animated: true)
    }
}

protocol HomeRouterType {
    func goToNextView()
}
