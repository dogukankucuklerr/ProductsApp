//
//  ProductsCell.swift
//  ProductsApp
//
//  Created by Doğukan Küçükler on 27.02.2024.
//

import UIKit

protocol CellProtocol {
    func AddtoBagClicked(indexPath : IndexPath)
}

class ProductsCell: UITableViewCell {

    
    @IBOutlet weak var cellBackground: UIView!
    
    
    @IBOutlet weak var imageViewProduct: UIImageView!
    
    
    @IBOutlet weak var labelProductName: UILabel!
    
    
    @IBOutlet weak var labelProductPrice: UILabel!
    
    var cellProtocol : CellProtocol?
    var indexPath : IndexPath?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
    @IBAction func buttonAddtoBag(_ sender: Any) {
        cellProtocol?.AddtoBagClicked(indexPath: indexPath!)
    }
    
    
    
    
}
