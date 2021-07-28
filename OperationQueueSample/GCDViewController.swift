//
//  GCDViewController.swift
//  OperationQueueSample
//
//  Created by phong070 on 28/07/2021.
//

import UIKit
class GCDViewController : UIViewController {
    let dispatch = DispatchQueue(label: "conccurent",attributes: .concurrent)
    let dispatchSerial = DispatchQueue(label: "serial")
    let dispathGroup = DispatchGroup()
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        //The concurrent meaning is running aync
        dispatch.async {
            print("Concurrent 1")
            print("Concurrent 1.1")
        }
        dispatch.async {
            print("Concurrent 2")
            print("Concurrent 2.2")
        }
        dispatch.async {
            print("Concurrent 3")
            print("Concurrent 3.3")
        }
        dispatch.async {
            print("Concurrent 4")
            print("Concurrent 4.4")
        }
        
        //The serial meaning is running sync
        dispatchSerial.async {
            print("Serial 1")
            print("Serial 1.1")
        }
        dispatchSerial.async {
            print("Serial 2")
            print("Serial 2.2")
        }
        dispatchSerial.async {
            print("Serial 3")
            print("Serial 3.3")
        }
        dispatchSerial.async {
            print("Serial 4")
            print("Serial 4.4")
        }
        
        
        dispathGroup.enter()
        print("Dispatch group 1")
        dispathGroup.leave()
        dispathGroup.enter()
        print("Dispatch group 2")
        dispathGroup.leave()
        dispathGroup.notify(queue: .global()) {
            print("Done")
        }
    }
}
