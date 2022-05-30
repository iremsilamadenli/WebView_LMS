//
//  ViewController.swift
//  lms_wv
//
//  Created by Irem Sıla Madenli on 26.02.2022.
//

import UIKit
import WebKit




class ViewController: UIViewController {

    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
                                    
        
      let url = URL(string: "https://lms.tedu.edu.tr")
      let request = URLRequest(url: url!)
        
        webview.load(request)
        
        
    }

    @IBAction func back(_ sender: Any) {
        
        if webview.canGoBack{
            
            webview.goBack()
            
        }
        
    }
    
    @IBAction func next(_ sender: Any) {
        
        if webview.canGoForward{
            
            webview.goForward()
        }
    }
    
    @IBAction func refresh(_ sender: Any) {
        
        webview.reload()
        
    }
    
    @IBAction func stop(_ sender: Any) {
        
        webview.stopLoading()
    }
    
}

