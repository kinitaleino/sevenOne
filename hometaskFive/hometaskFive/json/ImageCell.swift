//
//  ImageCell.swift
//  hometaskFive
//
//  Created by kinitaleino on 12/15/20.
//  Copyright © 2020 kinitaleino. All rights reserved.
//

import UIKit
import Nuke

final class ImageCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var imageURL: URL!{
        didSet{
            Nuke.loadImage(with: imageURL, into: imageView)
        }
    }
}
