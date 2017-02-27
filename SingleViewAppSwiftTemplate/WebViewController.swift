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
        
        webView = WKWebView(frame: CGRect(x: 0, y: 64, width: 375, height: 603))
        let moreInfoRequest = URLRequest(url: link)
        self.view.addSubview(webView)
        webView.load(moreInfoRequest)
        
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
