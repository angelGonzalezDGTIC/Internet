//
//  ViewControllerPDF.swift
//  Internet
//
//  Created by Ángel González on 29/10/22.
//

import UIKit
import WebKit

class ViewControllerPDF: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let webView = WKWebView(frame:self.view.frame)
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(webView)
        // 1. MOSTRAR UN PDF:
        // obtenemos la URL del recurso que se agregó al paquete del app
        /*if let laURL = Bundle.main.url(forResource: "idiomas", withExtension:"pdf") {
            webView.loadFileURL(laURL, allowingReadAccessTo: laURL)*/
        // 2. MOSTRAR UNA IMAGEN:
        if let laURL = URL(string:"https://www.nasa.gov/sites/default/files/thumbnails/image/halloween_sun_2014.jpeg") {
            do {
                let bytes = try Data(contentsOf: laURL)
                let imageview = UIImageView(frame: self.view.frame)
                imageview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                imageview.image = UIImage(data: bytes)
                self.view.addSubview(imageview)
            } catch {
                print ("ocurrió un error con la descarga \(error.localizedDescription)")
            }
        }
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
