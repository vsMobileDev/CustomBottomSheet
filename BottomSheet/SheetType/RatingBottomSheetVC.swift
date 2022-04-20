//
//  NewVC.swift
//  BottomSheet
//
//  Created by Vaibhav Sadana on 29/03/22.
//

import UIKit

class RatingBottomSheetVC: UIViewController {
    @IBOutlet weak var bottomContraint: NSLayoutConstraint!
    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var sheetView: UIView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(tapClick))
        backgroundView.addGestureRecognizer(tapGes)
        setupBottomSheet()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bottomContraint.constant = 0
        view.fadeInOut(duration: 0.4, delay: 0, completion: nil)
    }
    
    func setupBottomSheet(){
        sheetView.setupBottomSheetCornerRadius()
        blackView.layer.cornerRadius = 3
    }
    
    @objc func tapClick(){
        dismissBottomSheet()
    }
    
    func dismissBottomSheet(){
        self.bottomContraint.constant = -400
        view.fadeInOut(duration: 0.4, delay: 0, completion: nil)
        dismiss(animated: true, completion: nil)
    }
}


extension RatingBottomSheetVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 14
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
}
