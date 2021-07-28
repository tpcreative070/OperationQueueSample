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
        
        let concurrentOperationC = ConcurrentOperation { _ in
            print("concurrentOperationC waiting...")
            Thread.sleep(forTimeInterval: 2)
            for i in 1...1000{
                print("concurrentOperationC \(i)")
            }
        }
        
        let concurrentOperationD = ConcurrentOperation { _ in
            print("concurrentOperationD waiting...")
            Thread.sleep(forTimeInterval: 2)
            for i in 1...1000{
                print("concurrentOperationD \(i)")
            }
        }
        
        let concurrentOperationE = ConcurrentOperation { _ in
            print("concurrentOperationE waiting...")
            Thread.sleep(forTimeInterval: 2)
            for i in 1...1000{
                print("concurrentOperationE \(i)")
            }
        }
        queue.addChainedOperations([concurrentOperationA, concurrentOperationB,concurrentOperationC,concurrentOperationD,concurrentOperationE]) {
            print("addChainedOperations")
        }
        queue.addCompletionHandler {
           print("Finished")
        }
        queue.waitUntilAllOperationsAreFinished()
        print("Already finished")
    }
}

