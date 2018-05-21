//
//  UIViewControllerExt.swift
//  VelkeiMiklosNYTMP
//
//  Created by Velkei Miklós on 2018. 05. 15..
//  Copyright © 2018. NeonatCore. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

extension UIViewController{
    func presentSafariVC(url: String){
        guard let url = URL(string: url) else {
            return
        }
        let svc = SFSafariViewController(url: url)
        present(svc, animated: true, completion: nil)
    }
}
