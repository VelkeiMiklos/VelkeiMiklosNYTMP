//
//  ArticleCell.swift
//  VelkeiMiklósWUP
//
//  Created by Velkei Miklós on 2018. 05. 14..
//  Copyright © 2018. NeonatCore. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var thumbImg: CustomImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var authorLbl: UILabel!
    @IBOutlet weak var publishedDateLbl: UILabel!
    
    func configureCell(article: Article){
        
        configureColors()
        
        let media: Media!
        var mediaMetaData = [MediaMetadata]()
        
        media = article.media
        mediaMetaData = media.mediaMetadata
        let metaDataCount = mediaMetaData.count
        
        for (index,mediaMD) in mediaMetaData.enumerated(){
            //Check url type
            let end = mediaMD.url.index(mediaMD.url.endIndex, offsetBy: -4)
            let type = String(mediaMD.url[end...])
            if type == ImageType.JPG || type == ImageType.PNG{
                self.thumbImg.loadImage(urlString: mediaMD.url)
                self.titleLbl.text = article.title
                self.authorLbl.text = article.byline
                self.publishedDateLbl.text = article.publishedDate
                return
            }
            //If there is no "jpg" or "png" then default image
            if index == metaDataCount{
                self.thumbImg.image = #imageLiteral(resourceName: "no image")
            }
        }
    }
    
    private func configureColors(){
        self.bgView.backgroundColor = UIColor.customTableCellGray
        self.titleLbl.textColor = UIColor.customLblBoldGray
        self.authorLbl.textColor = UIColor.customLblGray
        self.publishedDateLbl.textColor = UIColor.customLblGray
    }
}
