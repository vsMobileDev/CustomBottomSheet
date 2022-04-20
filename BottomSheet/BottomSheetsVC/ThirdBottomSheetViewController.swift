//
//  ThirdBottomSheetViewController.swift
//  BottomSheet
//
//  Created by Vaibhav Sadana on 29/03/22.
//

import UIKit

class ThirdBottomSheetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func openSHeetBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "BottomSheets", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ReportBottomVC") as! ReportQuestionSheetVC
        controller.modalPresentationStyle = .overFullScreen
        controller.modalTransitionStyle = .crossDissolve
        present(controller, animated: true)
    }


}
