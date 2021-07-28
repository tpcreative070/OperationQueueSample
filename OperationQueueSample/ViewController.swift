//
//  ViewController.swift
//  OperationQueueSample
//
//  Created by phong070 on 28/07/2021.
//

import UIKit
import OperationQueuer
class ViewController: UIViewController {
    let queue = Queuer(name: "MyCustomQueue", maxConcurrentOperationCount: Int.max, qualityOfService: .default)
    override func viewDidLoad() {
        super.viewDidLoad()
        queue.addOperation {
            print("Hello World")
        }
        queue.pause()
        queue.addOperation {
            print("Waiting for to resume")
        }
        queue.resume()
    }
}

