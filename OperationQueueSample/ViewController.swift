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
        blockOperation()
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
        
        let operationQueue : OperationQueue = OperationQueue()
        operationQueue.maxConcurrentOperationCount = 1
        operationQueue.addOperation(testQueue())
        operationQueue.addOperations([testQueue()], waitUntilFinished: true)
        
    }
    
    func blockOperation(){
        let queue = OperationQueue()

        let operation1 = BlockOperation{
           print("operation1")
        }

        let operation2 = BlockOperation {
            print("operation2")
        }
        
        let operation3 = BlockOperation {
            print("operation3")
        }
    
        operation2.addDependency(operation3) // THIS IS THE KEY CODE IN YOUR CASE
        operation1.addDependency(operation2)
        queue.addOperation(operation1)
        queue.addOperation(operation2)
        queue.addOperation(operation3)
        //3,2,1
    }
}

class testQueue : Operation {
    override func main() {
        print("Main")
    }
    
    override func start() {
        print("start")
    }
    
    override func waitUntilFinished() {
        print("waitUntilFinished")
    }
}
