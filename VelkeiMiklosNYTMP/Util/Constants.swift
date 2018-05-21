//
//  Constants.swift
//  VelkeiMiklósWUP
//
//  Created by Velkei Miklós on 2018. 05. 14..
//  Copyright © 2018. NeonatCore. All rights reserved.
//

import Foundation
import UIKit

//9392b196cedd44d6bc8c8000788d3c42
//API-k
enum API {
//    static let URL_GROUP_LIST = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=9392b196cedd44d6bc8c8000788d3c42"
    static let API_KEY = "http://jwt.hostly.hu/show.php?id="
}

func articlesURL(withPeriod period: String) -> String{
    let url =  "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/\(period).json?api-key=\(API.API_KEY)"
    print(url)
    return url
}

//Gomb szövegek
enum AlertButtonName{
    static let OK = "Ok"
}

//Alert címek
enum MessageTitle{
    static let ERROR = "Hiba"
}
//Alert üzenetek
enum MessageText{
    static let INTERNET_ERROR = "Kérem csatlakozzon az internethez!"
    static let DOWNLOAD_ERROR = "Hiba az adatok letöltése közben"
}

//Segue-k
enum SegueID{
    static let SHOW_DETAIL = "showDetail"
}

//CollectionView cellák
enum TableViewCell{
    static let ARTICLE_CELL = "ArticleCell"
}
enum NavBar{
    static let MAIN_TITLE = "NY Times Most Popular"
}
