//
//  ViewController.swift
//  Weather
//
//  Created by Sergey Dunaev on 08.11.2017.
//  Copyright © 2017 SSoft. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }



    
    @IBAction func send(_ sender: UIButton) {
        
        let temperature = Int(textField.text!) ?? 0
        if WCSession.isSupported() {
        let session = WCSession.default
            if session.isWatchAppInstalled {
                do {
                  try session.updateApplicationContext(["temperature" : temperature])
                } catch {
                    print("Ошибка отправки контекста на часы \(error)")
                }
            }
        }
        
    }
    
}

