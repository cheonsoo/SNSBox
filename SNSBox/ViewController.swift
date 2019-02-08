//
//  ViewController.swift
//  SNSBox
//
//  Created by cpark on 01/02/2019.
//  Copyright © 2019 cpark. All rights reserved.
//

import UIKit
import WebKit



class ViewController: UIViewController {
    
    @IBOutlet weak var mainWebView: WKWebView!
    
    @IBOutlet weak var bookmarkSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var spinningActivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad();
        // Do any additional setup after loading the view, typically from a nib.
        
        let initialURL = "https://www.facebook.com";
        let myURL = URL( string: initialURL );
        let myRequest = URLRequest( url: myURL! );
        mainWebView.load( myRequest );
    }

    @IBAction func bookmartAction(_ sender: Any) {
        
        let target = bookmarkSegmentedControl.titleForSegment(at: bookmarkSegmentedControl.selectedSegmentIndex);
        
        var urlString = "";
        if target == "Facebook" {
            urlString = "https://www.facebook.com";
        } else if target == "Instagram" {
            urlString = "https://www.instagram.com";
        } else if target == "Twitter" {
            urlString = "https://www.twitter.com";
        } else if target == "Tumblr" {
            urlString = "https://www.tumblr.com";
        } else {
            urlString = "https://www.facebook.com";
        }
        
        goToUrl( url: urlString );
    }
    
    func goToUrl( url: String ) {
        let myUrl = URL( string : url );
        let myRequest = URLRequest( url : myUrl! );
        mainWebView.load( myRequest );
    }
    
    func webViewDidStartLoad(mainWebView: WKWebView) {
        spinningActivityIndicator.startAnimating();
    }
    
    func webViewDidFinishLoad(mainWebView: WKWebView) {
        spinningActivityIndicator.stopAnimating();
    }
    
}
