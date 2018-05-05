//
//  ViewController.swift
//  WebKitFramework
//
//  Created by AbdelRahman Aref on 5/5/18.
//  Copyright © 2018 AbdelRahman Aref. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController, UITextFieldDelegate,WKNavigationDelegate {

    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var forwardBtn: UIButton!
    @IBOutlet weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        urlTextField.delegate = self
        webView.navigationDelegate = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let urlString :String = "https://dwayr.com"
        let url:URL = URL(string: urlString)!
        let urlRequest: URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
        
        urlTextField.text = urlString
    }

    @IBAction func backBtnTapped(_ sender: Any) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction func forwardBtnTapped(_ sender: Any) {
        if webView.canGoForward{
            webView.goForward()
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        backBtn.isEnabled = webView.canGoBack
        forwardBtn.isEnabled = webView.canGoForward
        
        urlTextField.text = webView.url?.absoluteString
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let urlSting:String = urlTextField.text!
        let url:URL = URL(string: urlSting)!
        let urlRequest: URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
        
        textField.resignFirstResponder()
        return true
    }
}

