//
//  WebViewController.swift
//  Bout Time App
//
//  Created by Jevaughn McKenzie on 2/21/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit
import WebKit


class WebViewController: UIViewController {
    
    
    var webView: WKWebView!
    var link: URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView(frame: view.self)
        let moreInfoRequest = URLRequest(url: link)
        self.view.addSubview(webView)
        webView.load(moreInfoRequest)
        
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
