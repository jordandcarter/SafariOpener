//
//  ViewController.swift
//  SafariOpener
//
//  Created by Jordan Carter on 16/05/2024.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func openSafari(_ sender: UIButton) {
        if let url = URL(string: "https://www.apple.com") {
            UIApplication.shared.open(url)
        }
    }
}
