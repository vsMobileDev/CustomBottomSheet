//
//  OpenNativeSheetVC.swift
//  BottomSheet
//
//  Created by Vaibhav Sadana on 01/04/22.
//

import UIKit

class OpenNativeSheetVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func presentModal(){
        let storyboard = UIStoryboard(name: "NativeBottomSheet", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "NativeSheetVC") as! NativeBottomSheetVC
        vc.modalPresentationStyle = .pageSheet
        if let sheet = vc.sheetPresentationController{
            sheet.detents = [.medium()]
        }
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func btnPress(_ sender: Any) {
        presentModal()
    }
    
}
