//
//  SpyNavigationController.swift
//  PhotoAppTests
//
//  Created by Isaac Iniongun on 23/05/2023.
//

import UIKit

class SpyNavigationController: UINavigationController {
    
    var pushedViewController: UIViewController!

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        pushedViewController = viewController
    }

}
