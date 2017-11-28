//
//  ViewController.swift
//  webBrowser
//
//  Created by ADENIKE TOMOMEWO on 10/15/17.
//  Copyright © 2017 ADENIKE TOMOMEWO. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    @IBOutlet weak var mySearchBar: UISearchBar!

    @IBOutlet weak var myWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        myWebView.loadRequest(URLRequest(url: URL(string: "https://www.google.com")!))
    }

    @IBAction func back(_ sender: Any) {
        if myWebView.canGoBack{
            myWebView.goBack()
        }
    }
    @IBAction func next(_ sender: Any) {
        if myWebView.canGoForward{
            myWebView.goForward()
        }
    }
    
    @IBAction func refresh(_ sender: Any) {
        myWebView.reload()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        mySearchBar.resignFirstResponder()
        if let url = URL(string: "https://\(mySearchBar.text!)"){
            myWebView.loadRequest(URLRequest(url: url))
        }
        else{
            print("ERROR")
        }
        self.view.endEditing(true)
    }
    
    func webViewDidStartLoad(_ webView: UIWebView){
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
    }

    func webViewDidFinished(_ webView: UIWebView){
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}

