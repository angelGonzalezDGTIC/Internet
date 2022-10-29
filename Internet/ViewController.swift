//
//  ViewController.swift
//  Internet
//
//  Created by Ángel González on 28/10/22.
//

import UIKit
import WebKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let ad = UIApplication.shared.delegate as! AppDelegate
        if ad.internetStatus {
            // TODO:
            // 1. instanciar un objeto webview y colocarlo en la vista
            let wv = WKWebView(frame:self.view.frame)
            wv.allowsBackForwardNavigationGestures = true
            self.view.addSubview(wv)
            // 2. Obtener una página web y cargarla en el objeto webview
            if let laUrl = URL(string: "http://janzelaznog.com") {
                wv.load(URLRequest(url: laUrl))
            }
        }
        else {
            let ac = UIAlertController(title:"Error", message:"Lo sentimos, pero al parecer no hay conexión a Internet", preferredStyle: .alert)
            let action = UIAlertAction(title: "Enterado", style: .default)
            ac.addAction(action)
            self.present(ac, animated: true)
        }
    }
    

}

