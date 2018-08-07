//
//  WebViewController.swift
//  LiveTimeCounter
//
//  Created by Dr. Nürnberg on 07.08.18.
//  Copyright © 2018 PSI Logistics GmbH. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var myWebView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let url = URL (string: "http://www.psilogistics.com");
        let requestObj = URLRequest(url: url!);
        myWebView.load(requestObj);
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


