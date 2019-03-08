//
//  DetailsController.swift
//  jopFinder
//
//  Created by Yasin on 3/6/19.
//  Copyright © 2019 Yasin. All rights reserved.
//

import UIKit
import WebKit

class DetailsController: BaseController {
    var url:String?
    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       loadPage()
        // Do any additional setup after loading the view.
    }

    // Funcion to load web pag
    // The web page should be display details jobs
    func loadPage() {
        let pageURL = URL(string:url!)
        if pageURL == nil {
            self.alert(message: "URL is empty")
        }else{
            let urlRequest = URLRequest(url: pageURL!)
            webview.load(urlRequest)
        }
        
    }
}
