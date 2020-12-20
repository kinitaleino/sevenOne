//
//  JSONViewController.swift
//  hometaskFive
//
//  Created by kinitaleino on 12/15/20.
//  Copyright © 2020 kinitaleino. All rights reserved.
//

import UIKit

final class JSONViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    private lazy var presenter: Presenter = .init(view: self)
    private var imageURLs: [URL] = []{
        didSet{
            collectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.loadImages()
    }
    
    func uodateImages(with imageURLs: [URL]){
        self.imageURLs = imageURLs
    }
    
}

extension JSONViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imageURLs.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
        cell.imageURL = imageURLs[indexPath.row]
        return cell
    }
}
extension JSONViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let viewWidth = view.frame.width - 30
        let width = viewWidth/3
        return CGSize(width:width, height:width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
}





