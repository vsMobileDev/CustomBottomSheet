//
//  CalenderBottomSheetVC.swift
//  BottomSheet
//
//  Created by Vaibhav Sadana on 01/04/22.
//

import UIKit

class CalenderBottomSheetVC: UIViewController {
    
    @IBOutlet weak var listViewBtnImage: UIImageView!
    @IBOutlet weak var collectionViewBtnImage: UIImageView!
    @IBOutlet weak var selectedText: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var listCollectionView: UICollectionView!
    @IBOutlet weak var dropDownTblView: DropDownView!
    @IBOutlet weak var dropdownView: UIView!
    let obj = [
        "options": ["Answered","Marked for review","Not Answered","Not Visited"],
        "color": ["color_5E93FF","color_FFBC00","color_E6E6E6","color_E6E6E6"]
    ]
    
    var isListViewTapped = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(tapClick))
        backgroundView.addGestureRecognizer(tapGes)
        setupBottomSheet()
        
        dropdownView.layer.borderWidth = 1
        dropdownView.layer.borderColor = UIColor(red: 0.902, green: 0.902, blue: 0.902, alpha: 1).cgColor
        dropdownView.layer.cornerRadius = 4
        dropDownShadow()
    }
    
    func dropDownShadow(){
        let shadowPath0 = UIBezierPath(roundedRect: dropDownTblView.bounds, cornerRadius: 4)
        dropDownTblView.layer.shadowPath = shadowPath0.cgPath
        dropDownTblView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.08).cgColor
        dropDownTblView.layer.shadowOpacity = 1
        dropDownTblView.layer.shadowRadius = 5
        dropDownTblView.layer.shadowOffset = CGSize(width: 0, height: 2)
        dropDownTblView.layer.cornerRadius = 4
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
    
    @IBAction func openCollectionViewTapped(_ sender: Any) {
        collectionViewBtnImage.image = collectionViewBtnImage.image?.withRenderingMode(.alwaysTemplate)
        listViewBtnImage.image = listViewBtnImage.image?.withRenderingMode(.alwaysTemplate)
        collectionViewBtnImage.tintColor = UIColor(red: 0.937, green: 0.424, blue: 0, alpha: 1)
        listViewBtnImage.tintColor = .black
        isListViewTapped = false
        listCollectionView.reloadData()
    }
    
    @IBAction func openListViewTapped(_ sender: Any) {
        collectionViewBtnImage.image = collectionViewBtnImage.image?.withRenderingMode(.alwaysTemplate)
        listViewBtnImage.image = listViewBtnImage.image?.withRenderingMode(.alwaysTemplate)
        listViewBtnImage.tintColor = UIColor(red: 0.937, green: 0.424, blue: 0, alpha: 1)
        collectionViewBtnImage.tintColor = .black
        isListViewTapped = true
        listCollectionView.reloadData()
    }
    
    @IBAction func dropDownPress(_ sender: Any) {
        dropDownTblView.isHidden = dropDownTblView.isHidden ? false : true
        dropDownTblView.delegate = self
    }
}



extension CalenderBottomSheetVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == listCollectionView {
            return 30
        }
        return obj["options"]?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == listCollectionView {
            if isListViewTapped {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "listCategoryCell", for: indexPath) as! ListCategoryCollectionViewCell
                cell.calenderView.backgroundColor =  UIColor(red: 1, green: 0.737, blue: 0, alpha: 1)
                cell.layoutIfNeeded()
                return cell
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "listViewCell", for: indexPath) as! ListViewCollectionViewCell
                cell.datelbl.text = "2"
                cell.internalContent.layer.cornerRadius = 4
                if indexPath.row == 1 {
                    cell.internalContent.layer.borderColor = UIColor(red: 1, green: 0.737, blue: 0, alpha: 1).cgColor
                    cell.internalContent.backgroundColor = .white
                    cell.internalContent.layer.borderWidth = 1.0
                    cell.tagImage.isHidden = false
                } else if indexPath.row == 2 {
                    cell.internalContent.backgroundColor = UIColor(red: 0.902, green: 0.902, blue: 0.902, alpha: 1)
                    cell.tagImage.isHidden = true
                    cell.internalContent.layer.borderColor = UIColor.clear.cgColor
                }
                else if indexPath.row == 0 {
                    cell.internalContent.backgroundColor = UIColor(red: 0.369, green: 0.576, blue: 1, alpha: 1)
                    cell.tagImage.isHidden = true
                    cell.internalContent.layer.borderColor = UIColor.clear.cgColor
                } else {
                    cell.internalContent.backgroundColor = .white
                    cell.internalContent.layer.borderWidth = 1.0
                    cell.internalContent.layer.borderColor = UIColor.lightGray.cgColor
                    cell.tagImage.isHidden = true
                }
                
                return cell
            }
        } else{
            let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! OptionCollectionViewCell
            cell.lbloption.text = obj["options"]?[indexPath.row]
            cell.colorVIew.backgroundColor = UIColor(named: obj["color"]?[indexPath.row] ?? "")
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == listCollectionView {
            if isListViewTapped {
                return CGSize(width: listCollectionView.frame.width, height: 0)
            }
            return CGSize(width: 50, height: 50)
        } else{
            if indexPath.row == 1 {
                return CGSize(width: 125, height: 44)
            }
            return CGSize(width: 95, height: 44)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == listCollectionView{
            if !isListViewTapped{
                return 33
            }
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == listCollectionView{
            
            return 18
        }
        return 0
    }
}

extension CalenderBottomSheetVC : ListItem {
    func getSelectedItem(item: String) {
        selectedText.text = item
        dropDownTblView.isHidden = true
    }
}
