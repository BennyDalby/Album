//
//  ViewController.swift
//  Audible
//
//  Created by Test on 4/2/20.
//  Copyright © 2020 BennyTest. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegateFlowLayout {
    
    let cellID = "audibleCell"
    
    @IBOutlet weak var tutorialview: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
 
    @IBAction func CloseButtonClicked(_ sender: Any) {
        
        tutorialview.isHidden = true
        collectionView.reloadData()
        
    }
    
    
    var pages : [Page] {
        
        let first = Page(title: "Hello", message: "hello", imageName: "1.jpeg")
        let second = Page(title: "Hello", message: "hello", imageName: "2.jpeg")
        let third = Page(title: "Hello", message: "hello", imageName: "3.jpeg")
        
        return [first,second,third]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
           collectionView.register(PagerCell.self, forCellWithReuseIdentifier: cellID)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        collectionView.isPagingEnabled = true
        collectionView.collectionViewLayout = layout
        collectionView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        tutorialview.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        collectionView.backgroundColor = .black
        
        
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(sender:)))
        gesture.direction = .left
        self.tutorialview.addGestureRecognizer(gesture)
        
        loadGif()
        
    }
    
    
    @objc func handleSwipes(sender: UISwipeGestureRecognizer) {
        
        self.tutorialview.isHidden = true
     }
    
    
    func loadGif() {
        
        let jeremyGif = UIImage.gifImageWithName("flinstones")
           let imageView = UIImageView(image: jeremyGif)
        imageView.frame = CGRect(x: 0, y: self.view.frame.height - imageView.frame.height, width: self.view.frame.size.width, height: imageView.frame.height)
        self.tutorialview.addSubview(imageView)
    }


}






extension ViewController : UICollectionViewDelegate {
    
    
    
}

extension ViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 21
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! PagerCell

       // let page = pages[indexPath.item]
        //cell.page = page
        
        let imageName = String(indexPath.row+1) + ".jpeg"
        
        cell.imageView.image = UIImage(named: imageName)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
}

