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
        concurrent()
    }
    
    func concurrent(){
        let concurrentOperationA = ConcurrentOperation { _ in
            print("concurrentOperationA waiting...")
            Thread.sleep(forTimeInterval: 2)
            for i in 1...1000 {
                print("concurrentOperationA \(i)")
            }
        }
        let concurrentOperationB = ConcurrentOperation { _ in
            print("concurrentOperationB waiting...")
            Thread.sleep(forTimeInterval: 2)
            for i in 1...1000{
                print("concurrentOperationB \(i)")
            }
        }
        queue.addChainedOperations([concurrentOperationA, concurrentOperationB]) {
            print("addChainedOperations")
        }
        queue.addCompletionHandler {
           print("Finish")
        }
    }
}

