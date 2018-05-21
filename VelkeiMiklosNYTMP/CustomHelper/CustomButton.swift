//
//  CustomButton.swift
//  VelkeiMiklosNYTMP
//
//  Created by Velkei Miklós on 2018. 05. 15..
//  Copyright © 2018. NeonatCore. All rights reserved.
//

import UIKit
class CustomButton: UIButton {
    
    @IBInspectable var cornerRadious: CGFloat = 3.0{
        didSet{
            self.layer.cornerRadius = cornerRadious
        }
    }
    override func awakeFromNib() {
        setupView()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    func setupView(){
        self.layer.cornerRadius = cornerRadious
    }
}
