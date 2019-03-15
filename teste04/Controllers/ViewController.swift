//
//  ViewController.swift
//  teste04
//
//  Created by Paulo Matheus on 05/09/2018.
//  Copyright © 2018 Paulo Matheus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btSiteCreaJr(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://junior.creadf.org.br")! as URL, options: [:], completionHandler: nil) //compl. handler serve para retornar se abriu a página ou ñ.
        //options serve para ver a biblioteca de options, se prec. abrir no app ou em outro, por exemplo.
	}
    
    @IBAction func btSiteInatel(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.inatel.br/")! as URL, options: [:], completionHandler: nil)
    }

    @IBAction func btDiamante1(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.conexaoeagle.com.br/")! as URL, options: [:], completionHandler: nil)
    }
    @IBAction func btHelloGroup(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "http://www.hellogroup.me")! as URL, options: [:], completionHandler: nil)
    }
    @IBAction func btDiamante3(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.google.com.br/")! as URL, options: [:], completionHandler: nil)
    }
    @IBAction func btDiamante4(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.google.com.br/")! as URL, options: [:], completionHandler: nil)
    }
    @IBAction func btOuro1(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.conexaoeagle.com.br/")! as URL, options: [:], completionHandler: nil)
    }
    @IBAction func btOuro2(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.google.com.br/")! as URL, options: [:], completionHandler: nil)
    }
    @IBAction func Ouro3(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.google.com.br/")! as URL, options: [:], completionHandler: nil)
    }
    @IBAction func btOuro4(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.google.com.br/")! as URL, options: [:], completionHandler: nil)
    }
    @IBAction func btOuro5(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.google.com.br/")! as URL, options: [:], completionHandler: nil)
    }
    @IBAction func btOuro6(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.google.com.br/")! as URL, options: [:], completionHandler: nil)
    }
    @IBAction func btOuro7(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.google.com.br/")! as URL, options: [:], completionHandler: nil)
    }
    @IBAction func btOuro8(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.google.com.br/")! as URL, options: [:], completionHandler: nil)
    }
    
}

