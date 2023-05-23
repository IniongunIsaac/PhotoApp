//
//  FirstViewController.swift
//  PhotoApp
//
//  Created by Isaac Iniongun on 23/05/2023.
//

import UIKit

final class FirstViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func nextButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        navigationController?.pushViewController(secondViewController, animated: true)
    }
}
