//
//  ExamBottomSheetVC.swift
//  BottomSheet
//
//  Created by Vaibhav Sadana on 01/04/22.
//

import UIKit

class ExamBottomSheetVC: UIViewController {
    
    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var backgroundView: UIView!

    let testOptions = [
        "General Awareness",
        "Reasoning & Computer Aptitude",
        "General/Economy",
        "English Language",
        "Data Analysis & Interpretation"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(tapClick))
        backgroundView.addGestureRecognizer(tapGes)
        setupBottomSheet()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.bottomConstraint.constant = 0
        view.fadeInOut(duration: 0.4, delay: 0, completion: nil)
    }
    
    func dismissBottomSheet(){
        self.bottomConstraint.constant = -400
        view.fadeInOut(duration: 0.4, delay: 0, completion: nil)
        dismiss(animated: true, completion: nil)
    }
    
    @objc func tapClick(){
        dismissBottomSheet()
    }
    
    func setupBottomSheet(){
        mainView.setupBottomSheetCornerRadius()
        blackView.layer.cornerRadius = 3
    }
}

extension ExamBottomSheetVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        testOptions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TestCollectionViewCell
        cell.optionLbl.text = testOptions[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 48)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell  = collectionView.cellForItem(at: indexPath) as! TestCollectionViewCell
        cell.optionLbl.textColor =  UIColor(red: 0.937, green: 0.424, blue: 0, alpha: 1)
        cell.optionLbl.font = .boldSystemFont(ofSize: 15.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell  = collectionView.cellForItem(at: indexPath) as! TestCollectionViewCell
        cell.optionLbl.textColor =  UIColor.black
        cell.optionLbl.font = .systemFont(ofSize: 15.0)

    }
}
