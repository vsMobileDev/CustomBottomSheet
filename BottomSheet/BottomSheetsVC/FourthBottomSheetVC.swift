//
//  FourthBottomSheetVC.swift
//  BottomSheet
//
//  Created by Vaibhav Sadana on 01/04/22.
//

import UIKit

class FourthBottomSheetVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnClick(_ sender: Any) {
        let storyboard = UIStoryboard(name: "BottomSheets", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ExamBottomSheetVC") as! ExamBottomSheetVC
        controller.modalPresentationStyle = .overCurrentContext
        controller.modalTransitionStyle = .crossDissolve
        present(controller, animated: true)
    }

}
