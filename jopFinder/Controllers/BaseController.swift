//
//  BaseController.swift
//  jopFinder
//
//  Created by Yasin on 3/6/19.
//  Copyright © 2019 Yasin. All rights reserved.
//

import UIKit


public struct SearchParameters {
    var title:String?
    var latitude:Double?
    var longitude:Double?
    var provider:Provider?
}
// BaseController this root controllers
// add hear global function
// can use function every controller inherited from BaseController
class BaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // function to make navigation bar a visible
    func showNavigationController()  {
        UIView.animate(withDuration: 0.3) {
             self.navigationController?.isNavigationBarHidden = false
        }
       
    }
    // function to make navigation bar a invisible
    func hideNavigationController()  {
        UIView.animate(withDuration: 0.3) {
            self.navigationController?.isNavigationBarHidden = true
        }
    }
    
//    function to show alert msg
    func alert(message: String){
        let alert = UIAlertController(title: "Job Finder", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
