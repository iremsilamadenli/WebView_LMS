//
//  LocalStorage.swift
//  lms_wv
//
//  Created by Irem Sıla Madenli on 31/05/2022.
//

import Foundation
import WebKit
import SwiftUI

let APP_KEY = "YOUR APP KEY"
let REDIRECT_URI = "<YOUR SITE>.dropbox_auth.php"
let DB_URL = "https://www.dropbox.com/1/oauth2/authorize?client_id=APP_KEY&token_access_type=offline&response_type=code&redirect_uri=REDIRECT_URI"

class MyWKDelegate: NSObject, WKNavigationDelegate{
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("End loading")
        webView.evaluateJavaScript("document.body.innerHTML", completionHandler: { result, error in
            
            if let html = result as? String {
                    print(html)
                }
            })
    }
}

struct WebView: UIViewRepresentable {
        
    typealias UIViewType = WKWebView

    let webView: WKWebView
    
    func makeUIView(context: Context) -> WKWebView {
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) { }
}


class WebViewModel: ObservableObject {
    let webView: WKWebView
    let url: URL!
    let delegate = MyWKDelegate()
    
    init() {
        webView = WKWebView(frame: .zero)
        webView.navigationDelegate = delegate

        let urlStr = DB_URL.replacingOccurrences(of: "APP_KEY", with: APP_KEY).replacingOccurrences(of: "REDIRECT_URI", with: REDIRECT_URI)
        print(urlStr)
        url = URL(string: urlStr)

        loadUrl()
    }
    
    func loadUrl() {
        webView.load(URLRequest(url: url))
    }
}
