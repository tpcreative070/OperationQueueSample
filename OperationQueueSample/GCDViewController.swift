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
    override func viewDidLoad() {
        self.view.backgroundColor = .white
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
    }
}
