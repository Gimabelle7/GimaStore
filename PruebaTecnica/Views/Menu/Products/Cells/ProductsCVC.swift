//
//  ProductsCVC.swift
//  PruebaTecnica
//
//  Created by Gimabelle Garcia vasquez on 14/8/24.
//

import UIKit

class ProductsCVC: UICollectionViewCell {
    
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var viewImgColor: UIView!
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var imgProvider: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgProduct.image = nil
        setUpUI()
    }
    
    func setUpUI(){
        viewContainer.applyCorner(cornerRadius: 10, shadowColor: .gray, shadowOpacity: 0.3, shadowOffset: CGSize(width: 0, height: 1), shadowRadius: 5)
    }
    
    func configure(with item: Products?, isSelected: Bool) {
        lblTitle.text = item?.title ?? ""
        lblDescription.text = item?.description ?? ""
        lblPrice.text = "$\(StringHelper.formatPrice(item?.price ?? 0.0))"
        imgProduct.image = nil
        imgProvider.isHidden = true
        imgProvider.isHidden = !(item?.proveedorDB == FireConstant.provider)
        
        if imgProduct.image == nil {
            if let url = URL(string: item?.image ?? "") {
                imgProduct.loadImage(from: url, placeholder: UIImage(named: "placeholder")) { loadedImage in
                    if let _ = loadedImage {
                        //print("Image loaded successfully")
                    } else {
                        //print("Failed to load image")
                    }
                }
            }
        }

    }
    
}
