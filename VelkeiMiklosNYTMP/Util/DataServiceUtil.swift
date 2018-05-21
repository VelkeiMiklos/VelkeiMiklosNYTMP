//
//  DataService.swift
//  VelkeiMiklósWUP
//
//  Created by Velkei Miklós on 2018. 05. 14..
//  Copyright © 2018. NeonatCore. All rights reserved.
//

import Foundation
import Foundation
class DataServices{
    
    static let instance = DataServices()
    
    private lazy var  media_1 = [
        Media(type: "image", subtype: "photo", caption: "Rudolph W. Giuliani, who recently signed on as one of President Trump&rsquo;s lawyers for the special counsel investigation, has resigned from his law firm.", copyright: "Erin Schaff for The New York Times", approvedForSyndication: 1, mediaMetadata: media_meta_data)
    ]
    
    private lazy var  media_2 = [
        Media(type: "image", subtype: "photo", caption: "President Trump announced he was withdrawing from the Iran nuclear deal at the White House on Tuesday.", copyright: "Doug Mills/The New York Times", approvedForSyndication: 1, mediaMetadata: media_meta_data)
    ]
    
    private lazy var media_meta_data = [
        MediaMetadata(url: "https://static01.nyt.com/images/2018/05/09/us/politics/09dc-prexy-new1/09dc-prexy-new1-square320.jpg", format: "square320", height: 320, width: 320),
        MediaMetadata(url: "https://static01.nyt.com/images/2018/05/09/us/politics/09dc-prexy-new1/09dc-prexy-new1-thumbStandard.jpg", format: "Standard Thumbnail", height: 75, width: 75),
        MediaMetadata(url: "https://static01.nyt.com/images/2018/05/09/us/politics/09dc-prexy-new1/merlin_137858391_374a786d-1845-46db-9a17-e5035de36ade-articleInline.jpg", format: "Normal", height: 127, width: 190)
    ]
    
    private lazy var articles = [
            Article(url: "https://www.nytimes.com/2018/05/08/world/middleeast/trump-iran-nuclear-deal.html", adxKeywords: "Iran;Nuclear Weapons;Trump, Donald J;United States International Relations;Embargoes and Sanctions;Europe;North Korea", type: "Article", column: "", section: "World", byline: "By MARK LANDLER", title: "Trump Abandons Iran Nuclear Deal He Long Scorned", abstract: "Mr. Trump’s decision, while long anticipated and widely telegraphed, plunges America’s relations with European allies into deep uncertainty.", publishedDate: "2018-05-08", id: 100000005888324, assetID: 100000005888324, views: 1, desFacet: [], orgFacet: [], perFacet: [], geoFacet: [], media: media_1),
            
            Article(url: "https://www.nytimes.com/2018/05/10/us/politics/rudy-giuliani-resigns-law-firm-greenberg-traurig.html", adxKeywords: "Giuliani, Rudolph W;Greenberg Traurig LLP;Trump, Donald J;Cohen, Michael D (1966- );United States Politics and Government;Legal Profession", type: "Article", column: "", section: "World", byline: "By MICHAEL S. SCHMIDT and MAGGIE HABERMAN", title: "Giuliani’s Law Firm Undercuts His Statements as They Part Ways", abstract:"Rudolph W. Giuliani described hush-money payments like the ones made on behalf of President Trump as routine. Greenberg Traurig said it did not condone such arrangements.", publishedDate: "2018-05-10", id: 100000005894313, assetID: 100000005894313, views: 2, desFacet: [], orgFacet: [], perFacet: [], geoFacet: [], media: media_1),
            
            Article(url: "https://www.nytimes.com/2018/05/08/world/middleeast/trump-iran-nuclear-deal.html", adxKeywords: "Iran;Nuclear Weapons;Trump, Donald J;United States International Relations;Embargoes and Sanctions;Europe;North Korea", type: "Article", column: "", section: "World", byline: "By MARK LANDLER", title: "Trump Abandons Iran Nuclear Deal He Long Scorned", abstract: "Mr. Trump’s decision, while long anticipated and widely telegraphed, plunges America’s relations with European allies into deep uncertainty.", publishedDate: "2018-05-08", id: 100000005888324, assetID: 100000005888324, views: 1, desFacet: [], orgFacet: [], perFacet: [], geoFacet: [], media: media_1),
            Article(url: "https://www.nytimes.com/2018/05/08/world/middleeast/trump-iran-nuclear-deal.html", adxKeywords: "Iran;Nuclear Weapons;Trump, Donald J;United States International Relations;Embargoes and Sanctions;Europe;North Korea", type: "Article", column: "", section: "World", byline: "By MARK LANDLER", title: "Trump Abandons Iran Nuclear Deal He Long Scorned", abstract: "Mr. Trump’s decision, while long anticipated and widely telegraphed, plunges America’s relations with European allies into deep uncertainty.", publishedDate: "2018-05-08", id: 100000005888324, assetID: 100000005888324, views: 1, desFacet: [], orgFacet: [], perFacet: [], geoFacet: [], media: media_1),
            Article(url: "https://www.nytimes.com/2018/05/08/world/middleeast/trump-iran-nuclear-deal.html", adxKeywords: "Iran;Nuclear Weapons;Trump, Donald J;United States International Relations;Embargoes and Sanctions;Europe;North Korea", type: "Article", column: "", section: "World", byline: "By MARK LANDLER", title: "Trump Abandons Iran Nuclear Deal He Long Scorned", abstract: "Mr. Trump’s decision, while long anticipated and widely telegraphed, plunges America’s relations with European allies into deep uncertainty.", publishedDate: "2018-05-08", id: 100000005888324, assetID: 100000005888324, views: 1, desFacet: [], orgFacet: [], perFacet: [], geoFacet: [], media: media_1),
            Article(url: "https://www.nytimes.com/2018/05/08/world/middleeast/trump-iran-nuclear-deal.html", adxKeywords: "Iran;Nuclear Weapons;Trump, Donald J;United States International Relations;Embargoes and Sanctions;Europe;North Korea", type: "Article", column: "", section: "World", byline: "By MARK LANDLER", title: "Trump Abandons Iran Nuclear Deal He Long Scorned", abstract: "Mr. Trump’s decision, while long anticipated and widely telegraphed, plunges America’s relations with European allies into deep uncertainty.", publishedDate: "2018-05-08", id: 100000005888324, assetID: 100000005888324, views: 1, desFacet: [], orgFacet: [], perFacet: [], geoFacet: [], media: media_1),
        ]

    func getArticles()->[Article]{
        return articles
    }
    
}
