//
//  DetailPage.swift
//  ProductsApp
//
//  Created by Doğukan Küçükler on 27.02.2024.
//

import UIKit

class DetailPage: UIViewController {

    
    @IBOutlet weak var imageViewProduct: UIImageView!
    
    @IBOutlet weak var labelProductPrice: UILabel!
    
    var product : Products?
  
    override func viewDidLoad() {
        super.viewDidLoad()

        if let u = product {
            self.navigationItem.title = u.name
            imageViewProduct.image = UIImage(named: u.image!)
            labelProductPrice.text = "\(u.price!) ₺"
        }

    }
    
    @IBAction func buttonAddtoBag(_ sender: Any) {
        
        if let u = product {
            print("Detay Sayfa : \(u.name!) added to bag.")
        }
    }
    
}
