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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupColors()
    }
    
    func configureCell(article: Article){
//        self.thumbImg.loadImage(urlString: )
        self.titleLbl.text = article.title
        self.authorLbl.text = article.byline
        self.publishedDateLbl.text = article.publishedDate
    }
    
    private func setupColors(){
        self.bgView.backgroundColor = UIColor.customTableCellGray
        self.titleLbl.textColor = UIColor.customLblBoldGray
        self.authorLbl.textColor = UIColor.customLblGray
        self.publishedDateLbl.textColor = UIColor.customLblGray

    }
    
}
