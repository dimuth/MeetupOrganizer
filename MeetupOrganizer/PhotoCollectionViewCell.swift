//
//  PhotoGalleryCollectionViewCell.swift
//  MeetupOrganizer
//
//  Created by Ayuna NYC on 12/6/16.
//  Copyright © 2016 Ayuna NYC. All rights reserved.
//

import UIKit
import Photos
import NVActivityIndicatorView


class PhotoGalleryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var galleryImageView: UIImageView!

    private let manager = PHImageManager.default()
    private let deliveryOptions = PHImageRequestOptionsDeliveryMode.opportunistic
    private let requestOptions = PHImageRequestOptions()
    
    private let thumbnailSize = CGSize(width: 100, height: 100)
    
   
    var asset: PHAsset? {
        didSet {
            if let _asset = asset {
                
                manager.requestImage(for          : _asset,
                                     targetSize   : thumbnailSize,
                                     contentMode  : PHImageContentMode.aspectFill,
                                     options      : requestOptions,
                                     resultHandler: requestResultHandler)
            }
        }
    }
    
    
    private func requestResultHandler(image: UIImage?, properties: [AnyHashable: Any]?) -> Void {
        updateWithImage(image: image)
    }

    
    private func updateWithImage(image: UIImage?) {
        
        if let _image = image {
            galleryImageView.image = _image
        } else {
            galleryImageView.image = UIImage(named: PlaceholderGray)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        updateWithImage(image: nil)
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        updateWithImage(image: nil)
    }

    
}
