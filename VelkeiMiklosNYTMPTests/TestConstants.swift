//
//  TestConstants.swift
//  VelkeiMiklosNYTMPTests
//
//  Created by Velkei Miklós on 2018. 05. 19..
//  Copyright © 2018. NeonatCore. All rights reserved.
//

import Foundation

//MARK:- Periods
enum PeriodLink{
    static let link_1 = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/1.json?api-key=9392b196cedd44d6bc8c8000788d3c42"
    static let link_2 = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=9392b196cedd44d6bc8c8000788d3c42"
    static let link_3 = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/30.json?api-key=9392b196cedd44d6bc8c8000788d3c42"
}

//MARK:- SearchBar text
enum SearchBarText{
    static let text_1 = "Trump"
}

//MARK:- CollectionView cell ids
enum TableViewCell{
    static let ARTICLE_CELL = "ArticleCell"
}
//MARK:- Storyboard ids
enum Storyboard_ID{
    static let MAIN = "Main"
    static let MAIN_VC = "MainVC"
    static let DETAIL_VC = "DetailVC"
}

