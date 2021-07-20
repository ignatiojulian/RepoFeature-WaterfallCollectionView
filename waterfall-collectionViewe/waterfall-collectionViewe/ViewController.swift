//
//  ViewController.swift
//  waterfall-collectionViewe
//
//  Created by Ignatio Julian on 20/07/21.
//

import CHTCollectionViewWaterfallLayout
import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, CHTCollectionViewDelegateWaterfallLayout {
    
    private let collectionView: UICollectionView = {
        let layout = CHTCollectionViewWaterfallLayout()
        layout.itemRenderDirection = .leftToRight
        layout.columnCount = 2
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    struct Models {
        let imageName: String
        let height: CGFloat
    }
    
    private var model = [Models]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let images = Array(1...9).map { "image\($0)" }
        model = images.compactMap {
            return Models.init(
                imageName: $0,
                height: CGFloat.random(in: 300...600)
            )
        }
        
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ImageCollectionViewCell.identifier,
                for: indexPath
        ) as? ImageCollectionViewCell else {
            fatalError()
        }
        
        cell.configure(image: UIImage(named: model[indexPath.row].imageName))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(
            width: view.frame.size.width/2,
            height: model[indexPath.row].height)
    }

}

