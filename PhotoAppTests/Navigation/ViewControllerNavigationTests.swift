//
//  ViewControllerNavigationTests.swift
//  PhotoAppTests
//
//  Created by Isaac Iniongun on 23/05/2023.
//

import XCTest
@testable import PhotoApp

final class ViewControllerNavigationTests: XCTestCase {
    
    private var firstViewController: FirstViewController!
    private var navigationController: UINavigationController!

    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        firstViewController = storyboard.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        
        firstViewController.loadViewIfNeeded()
        
        navigationController = UINavigationController(rootViewController: firstViewController)
    }

    override func tearDownWithError() throws {
        firstViewController = nil
        navigationController = nil
    }

    func testNextButton_WhenTapped_SecondViewControllerIsPushed() throws {
        let predicate = NSPredicate { input, _ in
            (input as? UINavigationController)?.topViewController is SecondViewController
        }
        
        expectation(for: predicate, evaluatedWith: navigationController)
        
        firstViewController.nextButton.sendActions(for: .touchUpInside)
        
        waitForExpectations(timeout: 1.5)
    }
    
    func testNextButton_WhenTapped_SecondViewControllerIsPushed_v2() {
        firstViewController.nextButton.sendActions(for: .touchUpInside)
        
        RunLoop.current.run(until: Date())
        
        guard let _ = navigationController.topViewController as? SecondViewController else {
            XCTFail("topViewController of the UINavigationController should be SecondViewController by now")
            return
        }
    }
    
    func testNextButton_WhenTapped_SecondViewControllerIsPushed_v3() {
        let spyNavigationController = SpyNavigationController(rootViewController: firstViewController)
        
        firstViewController.nextButton.sendActions(for: .touchUpInside)
        
        guard let _ = spyNavigationController.pushedViewController as? SecondViewController else {
            XCTFail("pushedViewController of the SpyNavigationController should be SecondViewController by now")
            return
        }
    }

}
