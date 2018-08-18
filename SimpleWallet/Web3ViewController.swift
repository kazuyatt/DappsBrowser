//
//  Web3ViewController.swift
//  SimpleWallet
//
//  Created by niwatako on 2018/08/18.
//  Copyright © 2018年 Akifumi Fujita. All rights reserved.
//

import UIKit
import WebKit
import WebKitPlus

class Web3ViewController: UIViewController {
    
    @IBOutlet weak var searchbar: UISearchBar!
    
    public lazy var configuration: WKWebViewConfiguration = WKWebViewConfiguration()
    public lazy var webView: WKWebView = WKWebView(frame: self.view.frame, configuration: self.configuration)
    public lazy var uiDelegate: WKUIDelegatePlus = WKUIDelegatePlus(parentViewController: self)
    public lazy var observer: WebViewObserver = WebViewObserver(obserbee: self.webView)

    override func viewDidLoad() {
        super.viewDidLoad()

        webView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(webView, at: 0)
        webView.uiDelegate = uiDelegate
        observer.onTitleChanged = { [weak self] in self?.title = $0 }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        webView.load(URLRequest(url: URL(string: "https://google.co.jp/")!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension Web3ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        searchBar.showsCancelButton = true
        print(searchBar.text ?? "")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        self.view.endEditing(true)
        searchBar.text = ""
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.showsCancelButton = true
        return true
    }
}
