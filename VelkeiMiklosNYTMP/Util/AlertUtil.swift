//
//  AlertUtil.swift
//  VelkeiMiklósWUP
//
//  Created by Velkei Miklós on 2018. 05. 14..
//  Copyright © 2018. NeonatCore. All rights reserved.
//

import Foundation
import Foundation
import UIKit

class AlertUtil{
    
    static func showAlert(in vc: UIViewController, msg: String, title: String){
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: AlertButtonName.OK, style: .default, handler: nil)
        alertController.addAction(action)
        vc.present(alertController, animated: true, completion: nil)
    }
    
}
