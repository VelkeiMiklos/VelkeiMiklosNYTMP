//
//  CustomView.swift
//  VelkeiMiklosNYTMP
//
//  Created by Velkei Miklós on 2018. 05. 15..
//  Copyright © 2018. NeonatCore. All rights reserved.
//

import UIKit
class CustomView: UIView {
    
    @IBInspectable var cornerRadious: CGFloat = 3.0{
        didSet{
            self.layer.cornerRadius = cornerRadious
        }
    }
    
    override func awakeFromNib() {
        setupView()
        setupBorder()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    func setupView(){
        self.layer.cornerRadius = cornerRadious
    }
    
    func setupBorder(){
        layer.borderWidth = 1
        layer.borderColor = UIColor.customLblGray.cgColor
    }
    
}
