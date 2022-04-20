//
//  SecondBottomSheetViewController.swift
//  BottomSheet
//
//  Created by Vaibhav Sadana on 29/03/22.
//

import UIKit

class SecondBottomSheetViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func openBtnPresss(_ sender: Any) {
        let storyboard = UIStoryboard(name: "BottomSheets", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "RatingBottomSheetVC") as! RatingBottomSheetVC
        controller.modalPresentationStyle = .overFullScreen
        controller.modalTransitionStyle = .crossDissolve
        present(controller, animated: true)
    }
}
