//
//  ImageCollectionViewCell.swift
//  waterfall-collectionViewe
//
//  Created by Ignatio Julian on 20/07/21.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var bgView: UIView!
    @IBOutlet var label: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    static let identifier = "ImageCollectionViewCell"
    static let nib = "ImageCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupAppearance()
    }
    
    func setupAppearance() {
        bgView.backgroundColor = .gray
        bgView.contentMode = .scaleAspectFit
        bgView.layer.cornerRadius = 20
        
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
    }
    
    func configure(image: UIImage) {
        imageView.image = image
        label.text = "Test test"
    }
}
