//
//  ReportQuestionSheetVC.swift
//  BottomSheet
//
//  Created by Vaibhav Sadana on 31/03/22.
//

import UIKit

class ReportQuestionSheetVC: UIViewController {
    @IBOutlet weak var bottomContraint: NSLayoutConstraint!
    
    @IBOutlet weak var emptyOvalImage: UIImageView!
    @IBOutlet weak var tickImage: UIImageView!
    @IBOutlet weak var commentTf: UITextField!
    @IBOutlet weak var optionBoxView: UIView!
    @IBOutlet weak var questionBoxView: UIView!
    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var sheetView: UIView!
    @IBOutlet weak var backgroundView: UIView!
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
        questionBoxView.layer.borderColor = UIColor.gray.cgColor
        optionBoxView.layer.borderColor = UIColor.gray.cgColor
        questionBoxView.layer.borderWidth = 0.5
        optionBoxView.layer.borderWidth = 0.5
        questionBoxView.layer.cornerRadius = 5
        optionBoxView.layer.cornerRadius = 5
    }
    
    @objc func tapClick(){
        dismissBottomSheet()
    }
    
    func dismissBottomSheet(){
        self.bottomContraint.constant = -400
        view.fadeInOut(duration: 0.4, delay: 0, completion: nil)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func optionBoxClciked(_ sender: Any) {
        emptyOvalImage.image = UIImage(named: "Oval")
        tickImage.image = UIImage(named: "OvalBlank")
    }
    @IBAction func questionBoxClicked(_ sender: Any) {
        emptyOvalImage.image = UIImage(named: "OvalBlank")
        tickImage.image = UIImage(named: "Oval")
        
    }
}
