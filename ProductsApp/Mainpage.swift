//
//  ViewController.swift
//  ProductsApp
//
//  Created by Doğukan Küçükler on 27.02.2024.
//

import UIKit

class Mainpage: UIViewController {

    
    @IBOutlet weak var productsTableView: UITableView!
    
    var productsList = [Products]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        productsTableView.delegate = self
        productsTableView.dataSource = self
        
        
        let u1 = Products(id: 1 , name: "Macbook Pro 14", image : "bilgisayar",price: 43000)
        let u2 = Products(id: 2 , name: "Rayban Club Master", image : "gozluk",price: 2500)
        let u3 = Products(id: 3 , name: "Sony ZX Series", image : "kulaklik",price: 40000)
        let u4 = Products(id: 4 , name: "Gio Armani", image : "parfum",price: 2000)
        let u5 = Products(id: 5 , name: "Casio X Series", image : "saat",price: 8000)
        let u6 = Products(id: 6 , name: "Dyson V8", image : "supurge",price: 18000)
        let u7 = Products(id: 7 , name: "IPhone 13", image : "telefon",price: 32000)
        productsList.append(u1)
        productsList.append(u2)
        productsList.append(u3)
        productsList.append(u4)
        productsList.append(u5)
        productsList.append(u6)
        productsList.append(u7)

        productsTableView.separatorColor = UIColor(white: 0.95, alpha: 1)
    }
}

extension Mainpage : UITableViewDelegate, UITableViewDataSource, CellProtocol {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = productsList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "productsCell") as!
        ProductsCell
        
        cell.imageViewProduct.image = UIImage(named: product.image!)
        cell.labelProductName.text = product.name
        cell.labelProductPrice.text = "\(product.price!) ₺"
        
        cell.backgroundColor = UIColor(white: 0.95, alpha: 1)
        cell.cellBackground.layer.cornerRadius = 15.0
        
        cell.selectionStyle = .none
        
        cell.cellProtocol = self
        cell.indexPath = indexPath
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let product = productsList[indexPath.row]
        
        let deleteaction = UIContextualAction(style: .destructive, title: "Delete") {
            contextualAction, view, bool in
            print("\(product.name!) deleted")
            
        }
        let editaction = UIContextualAction(style: .normal, title: "Edit") {
            contextualAction, view, bool in
            print("\(product.name!) edited")
        }
    return UISwipeActionsConfiguration(actions: [deleteaction,editaction])
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = productsList[indexPath.row]
     performSegue(withIdentifier: "toDetail", sender: product)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let product = sender as? Products {
                let destinationVC = segue.destination as! DetailPage
                destinationVC.product = product
            }
        }
    }
    
    func AddtoBagClicked(indexPath: IndexPath) {
        let product = productsList[indexPath.row]
        print("\(product.name!) added to bag.")
    }
}
