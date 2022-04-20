//
//  BottomSheetViewController.swift
//  BottomSheet
//
//  Created by Vaibhav Sadana on 28/03/22.
//

import UIKit


class BottomSheetViewController: UIViewController {
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomStackView: UIStackView!
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var topbarView: UIView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var rightBtn: UIButton!
    @IBOutlet weak var leftBtn: UIButton!
    
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
        bottomView.setupBottomSheetCornerRadius()
        topbarView.layer.cornerRadius = 3
    }

    @IBAction func rightBtnPress(_ sender: Any) {
        
    }
    @IBAction func leftBtnPress(_ sender: Any) {
        dismissBottomSheet()
    }
    
}
