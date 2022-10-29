//
//  ViewController.swift
//  Internet
//
//  Created by Ángel González on 28/10/22.
//

import UIKit
import WebKit


class ViewController : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let ad = UIApplication.shared.delegate as! AppDelegate
        if ad.internetStatus {
            let ac = UIAlertController(title:"Confirma", message:"Deseas abrir esta página en el browser?", preferredStyle: .alert)
            let action = UIAlertAction(title: "SI", style: .default, handler: { boton in
                if let laUrl = URL(string: "https://www.unam.mx") {
                    // siempre hay que comprobar si una URL se puede "abrir" en el dispositivo
                    if UIApplication.shared.canOpenURL(laUrl) {
                        // si el s.o. comprueba que se puede abrir la URL, entonces la lanzamos
                        UIApplication.shared.open(laUrl, options:[:])
                    }
                }
            })
            ac.addAction(action)
            let action2 = UIAlertAction(title: "NO, ábrela aquí", style: .cancel, handler: { boton in
                // TODO: 1. instanciar un objeto webview y colocarlo en la vista
                let wv = WKWebView(frame:self.view.frame)
                wv.allowsBackForwardNavigationGestures = true
                self.view.addSubview(wv)
                // TODO: 2. Obtener una página web y cargarla en el objeto webview
                if let laUrl = URL(string: "https://www.unam.mx") {
                    wv.load(URLRequest(url: laUrl))
                }
            })
            ac.addAction(action2)
            self.present(ac, animated: true)
        }
        else {
            let ac = UIAlertController(title:"Error", message:"Lo sentimos, pero al parecer no hay conexión a Internet", preferredStyle: .alert)
            let action = UIAlertAction(title: "Enterado", style: .default)
            ac.addAction(action)
            self.present(ac, animated: true)
        }
    }
    

}

