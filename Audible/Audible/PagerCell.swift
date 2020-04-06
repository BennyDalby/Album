//
//  PagerCell.swift
//  Audible
//
//  Created by Test on 4/2/20.
//  Copyright © 2020 BennyTest. All rights reserved.
//

import UIKit

class PagerCell : UICollectionViewCell {
    
    var imageView: UIImageView!
    var lbl: UILabel!
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = false
        imageView.clipsToBounds = true
        imageView.backgroundColor = .black
        contentView.addSubview(imageView)
        
        lbl = UILabel()
        lbl.isEnabled = false
        contentView.addSubview(lbl)
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var page: Page? {
        didSet {

            imageView.image = UIImage(named: page!.imageName)
            lbl.text = page?.title
            lbl.textColor = .black
            
        }
    }
    
    
    override func layoutSubviews() {
        
      
        imageView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        
        lbl.frame = CGRect(x: 50, y: 200, width: 130, height: 50)
        
        
         
        
    }
    
}
