//
//  TestCollectionViewCell.swift
//  waterfall-collectionViewe
//
//  Created by Ignatio Julian on 13/01/22.
//

import UIKit

class TestCollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
    
    static let identifier = "TestCollectionViewCell"
    static let nib = "TestCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
//    func configure(image: UIImage) {
//        imageView.image = image
//    }

}
