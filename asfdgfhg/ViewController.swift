//
//  ViewController.swift
//  asfdgfhg
//
//  Created by MacBook Air on 08.09.2020.
//  Copyright © 2020 VardanMakhsudyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.setTitle("Picture", for: .normal)
        button.setTitleColor(.yellow, for: .normal)
        button.backgroundColor = .black
        image.isHidden = true
        activityIndicator.isHidden = true
        activityIndicator.color = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        
        UIView.animate(withDuration: 0, delay: 5, options: .curveEaseIn, animations: {
            self.activityIndicator.alpha = 2
        }) { (finshed) in
            self.activityIndicator.stopAnimating()
            self.image.isHidden = false
            self.activityIndicator.isHidden = true
        }
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        self.activityIndicator.startAnimating()
        self.activityIndicator.isHidden = false
        
        guard let url = URL(string: "https://fotos.perfil.com/2020/08/03/cropped/696/696/center/luna-de-hoy-en-acuario-la-mas-rebelde-995726.jpg") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data , let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image.image = image
                    self.button.isEnabled = false
                }
            }
        }.resume()
    }
}
