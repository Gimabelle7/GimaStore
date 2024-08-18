//
//  CategoriesCVC.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 13/8/24.
//

import UIKit

class CategoriesCVC: UICollectionViewCell {
    
    
    
    @IBOutlet weak var lblTitle: UILabel!
    
    let colorTitleUnselect = #colorLiteral(red: 0.003921568859, green: 0.003921568859, blue: 0.003921568859, alpha: 1)
    let colorViewUnselect = #colorLiteral(red: 0.8688104749, green: 0.878759563, blue: 0.8828889728, alpha: 1)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    func setupUI() {
        self.layer.cornerRadius = 17
        self.backgroundColor = .white
        lblTitle.textColor = .black
    
        lblTitle.translatesAutoresizingMaskIntoConstraints = false

         NSLayoutConstraint.activate([
            lblTitle.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
             lblTitle.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
         ])
    }
    
    func configure(with item: String?, isSelected: Bool) {
        guard let lblTitle = lblTitle else {
             print("lblTitleCategories es nil")
             return
         }
         lblTitle.text = item
        
        if isSelected {
            self.backgroundColor = .purple
            lblTitle.textColor = .white
        } else {
            self.backgroundColor = colorViewUnselect
            lblTitle.textColor = colorTitleUnselect
        }
    }
}
