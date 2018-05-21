//
//  DetailVC.swift
//  VelkeiMiklósWUP
//
//  Created by Velkei Miklós on 2018. 05. 14..
//  Copyright © 2018. NeonatCore. All rights reserved.
//

import UIKit
class DetailVC: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var sectionLbl: UILabel!
    @IBOutlet weak var abstractLbl: UILabel!
    @IBOutlet weak var captionLbl: UILabel!
    @IBOutlet weak var thumbImg: CustomImageView!
    @IBOutlet weak var typeMainLbl: UILabel!
    @IBOutlet weak var sectionMainLbl: UILabel!
    @IBOutlet weak var leftView: CustomView!
    @IBOutlet weak var rightView: CustomView!
    @IBOutlet weak var linkBtn: CustomButton!
    
    //MARK:- Variables
    var article: Article?
    
    //MARK:- View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.accessibilityIdentifier = View_ID.VIEW_ID_DETAIL_VC
        configureColors()
        configureNavBar()
        configureUI()
        configureColors()
    }
    
    //MARK:- Configurations
    private func configureColors(){
        self.typeLbl.textColor = UIColor.customLblGray
        self.sectionLbl.textColor = UIColor.customLblGray
        self.abstractLbl.textColor = UIColor.customLblGray
        self.captionLbl.textColor = UIColor.customLblGray
        self.typeMainLbl.textColor = UIColor.customLblBoldGray
        self.sectionMainLbl.textColor = UIColor.customLblBoldGray
        self.leftView.backgroundColor = UIColor.customTableCellGray
        self.rightView.backgroundColor = UIColor.customTableCellGray
        self.linkBtn.backgroundColor = UIColor.customGreen
        self.linkBtn.setTitleColor(UIColor.white, for: .normal)
    }
    
    private func configureNavBar(){
        if let source = article?.source{
            navigationItem.title  = "\(NavBar.SOURCE) \(source)"
        }else{
            navigationItem.title  = NavBar.SOURCE_IS_UNKNOW
        }
    }
    
    private func configureUI(){
        
        var mediaMetaData = [MediaMetadata]()
        let metaDataCount = mediaMetaData.count
        
        if let media = article?.media{
            mediaMetaData = media.mediaMetadata
            for (index,mediaMD) in mediaMetaData.enumerated(){
                //Check url type
                let end = mediaMD.url.index(mediaMD.url.endIndex, offsetBy: -4)
                let type = String(mediaMD.url[end...])
                if type == ImageType.JPG || type == ImageType.PNG{
                    self.thumbImg.loadImage(urlString: mediaMD.url)
                    
                    if media.caption == ""{
                        self.captionLbl.text = StaticText.CAPTION
                    }else{
                        self.captionLbl.text = media.caption
                    }
                    
                    if let type = article?.type{
                        self.typeLbl.text = type
                    }else{
                        self.typeLbl.text = ""
                    }
                    
                    if let section = article?.section{
                        self.sectionLbl.text = section
                    }else{
                        self.sectionLbl.text = ""
                    }
                    
                    if let abstract = article?.abstract{
                        self.abstractLbl.text = abstract
                    }else{
                        self.abstractLbl.text = ""
                    }
                    return
                }
                //If there is no "jpg" or "png" then default image
                if index == metaDataCount{
                    self.thumbImg.image = #imageLiteral(resourceName: "no image")
                    if media.caption == ""{
                        self.captionLbl.text = StaticText.CAPTION
                    }else{
                        self.captionLbl.text = media.caption
                    }
                }
            }
        }
    }
    
    //MARK:- Actions
    @IBAction func linkBtnWasPressed(_ sender: Any) {
        guard let url = article?.url else { return }
        self.presentSafariVC(url: url)
    }
}
