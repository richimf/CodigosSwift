//
//  ViewController.swift
//  Certificado
//
//  Created by Ricardo Montesinos Fernandez on 12/13/16.
//  Copyright © 2016 Ricardo Montesinos Fernandez. All rights reserved.
//

import UIKit
import Security

class ViewController: UIViewController, UIWebViewDelegate, NSURLConnectionDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    var loadingUnvalidatedHTTPSPage:Bool!
    var connection:NSURLConnection!
    
    let path = "https://www.google.com.mx/" //MY URL WITH NOT VALID CERTIFICATE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.delegate = self
        webView.scalesPageToFit = true
        webView.contentMode = .scaleAspectFit
        
        let requestObj = NSURLRequest.init(url: URL(string: path)!, cachePolicy: NSURLRequest.CachePolicy.useProtocolCachePolicy, timeoutInterval: 10.0)
        let conn:NSURLConnection = NSURLConnection(request: requestObj as URLRequest, delegate: self)!
        conn.start()
        
        self.loadingUnvalidatedHTTPSPage = true
        webView.loadRequest(requestObj as URLRequest)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK - DELEGATE METHODS WEBVIEW
    private func webView(webView: UIWebView!, didFailLoadWithError error: NSError!) {
        print("Webview fail with error \(error)");
        
        if(error.domain == NSURLErrorDomain){
            if (error.code == NSURLErrorServerCertificateHasBadDate || error.code == NSURLErrorServerCertificateUntrusted   ||
                error.code == NSURLErrorServerCertificateHasUnknownRoot || error.code == NSURLErrorServerCertificateNotYetValid) {
                print("\n ---- :C ....")
            }
        }
    }
    
    private func webView(webView: UIWebView!, shouldStartLoadWithRequest request: NSURLRequest!, navigationType: UIWebViewNavigationType) ->Bool{
        print("Webview iniciando");
        if (self.loadingUnvalidatedHTTPSPage!) {
            self.connection = NSURLConnection(request: request as URLRequest, delegate: self)
            self.connection.start();
            return false;
        }
        return true;
    }
    
    private func webViewDidStartLoad(webView: UIWebView!) {
        print("Webview started Loading")
    }
    
    private func webViewDidFinishLoad(webView: UIWebView!) {
        print("Webview did finish load")
    }
    
    
    // MARK - NSURLConnectionDelegate methods
    func connection(_ connection: NSURLConnection, willSendRequestFor challenge: URLAuthenticationChallenge) {
        let trust:SecTrust = challenge.protectionSpace.serverTrust!;
        let cred:URLCredential = URLCredential(trust: trust)
        challenge.sender?.use(cred, for: challenge)
    }
    
    func connection(_ connection: NSURLConnection, NSURLConnection response:URLResponse){
        let requestObj:NSURLRequest = NSURLRequest(url: URL(string: path)!, cachePolicy: NSURLRequest.CachePolicy.returnCacheDataElseLoad, timeoutInterval: 20.0)
        self.loadingUnvalidatedHTTPSPage = false
        self.webView.loadRequest(requestObj as URLRequest)
        self.connection.cancel()
    }

}
