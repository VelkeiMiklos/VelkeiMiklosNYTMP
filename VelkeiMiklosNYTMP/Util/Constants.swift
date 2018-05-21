//
//  Constants.swift
//  VelkeiMiklósWUP
//
//  Created by Velkei Miklós on 2018. 05. 14..
//  Copyright © 2018. NeonatCore. All rights reserved.
//

import Foundation
import UIKit

//MARK:- API
enum API {
    static let URL_BASE = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/"
    static let API_KEY = "9392b196cedd44d6bc8c8000788d3c42"
    static let JSON_API_KEY = ".json?api-key="
}

//MARK:- Buttom titles
enum AlertButtonName{
    static let OK = "Ok"
}

//MARK:- Alert titles
enum MessageTitle{
    static let ERROR = "Error"
}

//MARK:- Alert messages
enum MessageText{
    static let INTERNET_ERROR = "Please connect to the Internet!"
    static let DOWNLOAD_ERROR = "Error while downloading data from server!"
}

//MARK:- Segues
enum SegueID{
    static let SHOW_DETAIL = "showDetail"
}

//MARK:- CollectionView cell ids
enum TableViewCell{
    static let ARTICLE_CELL = "ArticleCell"
}

//MARK:- NavBar texts
enum NavBar{
    static let MAIN_TITLE = "NY Times Most Popular"
    static let SOURCE = "Source:"
    static let SOURCE_IS_UNKNOW = "Source is unknow"
}

//MARK:- Static texts
enum StaticText{
    static let CAPTION = "No Caption"
}

//MARK:- Header
enum Header{
    static let CONTENT_TYPE =  "Content-Type"
    static let APPLICATION = "application/json; charset=utf-8"
}

//MARK:- JSON constants
enum JSONConstant{
    static let URL = "url"
    static let ADX_KEYWORDS = "adx_keywords"
    static let BY_LINE = "byline"
    static let TYPE = "type"
    static let TITLE = "title"
    static let SECTION = "section"
    static let ABSTRACT = "abstract"
    static let PUBLISHED_DATE = "published_date"
    static let SOURCE = "source"
    static let DES_FACET = "des_facet"
    static let ORG_FACET = "org_facet"
    static let PER_FACET = "per_facet"
    static let GEO_FACET = "geo_facet"
    static let MEDIA = "media"
    static let MEDIA_METADATA = "media-metadata"
    static let RESULT = "results"
    static let ID = "id"
    static let ASSET_ID = "asset_id"
    static let VIEWS = "views"
    static let SUBTYPE = "subtype"
    static let CAPTION = "caption"
    static let COPYRIGHT = "copyright"
    static let FORMAT = "format"
    static let HEIGHT = "height"
    static let WIDTH = "width"
    static let APPROVED_FOR_SYNDICATION = "approved_for_syndication"
}

//MARK:- Picture formats
enum ImageType{
   static let JPG = ".jpg"
   static let PNG = ".png"
}

//View ids
enum View_ID{
    static let VIEW_ID_DETAIL_VC = "VIEW_ID_DETAIL_VC"
    static let VIEW_ID_MAIN_VC = "VIEW_ID_MAIN_VC"
}

