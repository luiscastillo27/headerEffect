//
//  HeaderView.swift
//  profileEffect
//
//  Created by Luis Castillo on 26/08/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage? {
        didSet {
            if let img = image {
                imageView.image = img
            } else {
                imageView.image = nil
            }
        }
    }
}
