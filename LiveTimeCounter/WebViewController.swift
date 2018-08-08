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

class WebViewController: UIViewController, WKUIDelegate {
    

    @IBOutlet weak var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        self.webView = WKWebView(frame: .zero, configuration: webConfiguration)
        self.webView.uiDelegate = self
        self.view = self.webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let requestObj = URLRequest(url: CounterModel.shared().url);
        webView.load(requestObj);
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


