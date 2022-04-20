//
//  ViewController.swift
//  BottomSheet
//
//  Created by Vaibhav Sadana on 28/03/22.
//

import UIKit

class FirstBottomSheetViewController: UIViewController {
    
    @IBOutlet weak var openBottomSheet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        openBottomSheet.layer.cornerRadius = 10
    }
    
    @IBAction func bottomSheetAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "BottomSheets", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "BottomSheetVC") as! BottomSheetViewController
        controller.modalPresentationStyle = .overCurrentContext
        controller.modalTransitionStyle = .crossDissolve
        present(controller, animated: true)
    }
}

