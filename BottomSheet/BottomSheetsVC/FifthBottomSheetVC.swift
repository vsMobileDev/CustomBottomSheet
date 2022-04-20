//
//  FifthBottomSheetVC.swift
//  BottomSheet
//
//  Created by Vaibhav Sadana on 01/04/22.
//

import UIKit

class FifthBottomSheetVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func btnClick(_ sender: Any) {
        let storyboard = UIStoryboard(name: "BottomSheets", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "CalenderBottomSheetVC") as! CalenderBottomSheetVC
        controller.modalPresentationStyle = .overCurrentContext
        controller.modalTransitionStyle = .crossDissolve
        present(controller, animated: true)
    }
}
