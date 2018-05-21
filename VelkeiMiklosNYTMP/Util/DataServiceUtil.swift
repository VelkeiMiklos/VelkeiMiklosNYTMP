//
//  DataService.swift
//  VelkeiMiklósWUP
//
//  Created by Velkei Miklós on 2018. 05. 14..
//  Copyright © 2018. NeonatCore. All rights reserved.
//

import Foundation
import UIKit
class DataServices{
    
    //MARK:- Variables
    static let instance = DataServices()
    
    //MARK:- Dates
    private let date1 = DateConverterHelper.stringDateConvertoToDate(date: "2018-05-16")
    private let date2 = DateConverterHelper.stringDateConvertoToDate(date: "2018-05-17")
    private let date3 = DateConverterHelper.stringDateConvertoToDate(date: "2018-05-18")
    private let date4 = DateConverterHelper.stringDateConvertoToDate(date: "2018-05-19")
    private let date5 = DateConverterHelper.stringDateConvertoToDate(date: "2018-05-20")
    
    //MARK:- Medias
    private lazy var  media_1 =
        Media(type: "image", subtype: "photo", caption: "Rudolph W. Giuliani, who recently signed on as one of President Trump&rsquo;s lawyers for the special counsel investigation, has resigned from his law firm.", copyright: "Erin Schaff for The New York Times", approvedForSyndication: 1, mediaMetadata: media_meta_data)
    
    private lazy var  media_2 =
        Media(type: "image", subtype: "photo", caption: "President Trump announced he was withdrawing from the Iran nuclear deal at the White House on Tuesday.", copyright: "Doug Mills/The New York Times", approvedForSyndication: 1, mediaMetadata: media_meta_data)
    
    private lazy var  media_3 =
        Media(type: "image", subtype: "photo", caption: "President Trump announced he was withdrawing from the Iran nuclear deal at the White House on Tuesday.", copyright: "Doug Mills/The New York Times", approvedForSyndication: 1, mediaMetadata: media_meta_data_2)
    
    //MARK:- Media meta data
    private lazy var media_meta_data = [
        MediaMetadata(url: "https://static01.nyt.com/images/2018/05/09/us/politics/09dc-prexy-new1/09dc-prexy-new1-square320.jpg", format: "square320", height: 320, width: 320),
        MediaMetadata(url: "https://static01.nyt.com/images/2018/05/09/us/politics/09dc-prexy-new1/09dc-prexy-new1-square320.jpg", format: "Standard Thumbnail", height: 75, width: 75),
        MediaMetadata(url: "https://static01.nyt.com/images/2018/05/09/us/politics/09dc-prexy-new1/09dc-prexy-new1-square320.jpg", format: "Normal", height: 127, width: 190)
    ]
    
    private lazy var media_meta_data_2 = [
        MediaMetadata(url: "https://static01.nyt.com/images/2018/05/09/us/politics/09dc-prexy-new1/09dc-prexy-new1-square320.asd", format: "square320", height: 320, width: 320),
        MediaMetadata(url: "https://static01.nyt.com/images/2018/05/09/us/politics/09dc-prexy-new1/09dc-prexy-new1-thumbStandard.asd", format: "Standard Thumbnail", height: 75, width: 75),
        MediaMetadata(url: "https://static01.nyt.com/images/2018/05/09/us/politics/09dc-prexy-new1/merlin_137858391_374a786d-1845-46db-9a17-e5035de36ade-articleInline.asd", format: "Normal", height: 127, width: 190)
    ]
    
    //MARK:- Articles
    private lazy var articles = [
        Article(url: "https://www.nytimes.com/2018/05/08/world/middleeast/trump-iran-nuclear-deal.html", adxKeywords: "Iran;Nuclear Weapons;Trump, Donald J;United States International Relations;Embargoes and Sanctions;Europe;North Korea", type: "Article",  section: "World", byline: "By MARK LANDLER", title: "Trump Abandons Iran Nuclear Deal He Long Scorned", abstract: "Mr. Trump’s decision, while long anticipated and widely telegraphed, plunges America’s relations with European allies into deep uncertainty.", publishedDate: "2018-05-16", source: "The New York Times", id: 100000005888324, assetID: 100000005888324, views: 1, desFacet: [], orgFacet: [], perFacet: [], geoFacet: [], media: media_1, publishedDateToSort:  date1),
        
        Article(url: "https://www.nytimes.com/2018/05/10/us/politics/rudy-giuliani-resigns-law-firm-greenberg-traurig.html", adxKeywords: "Giuliani, Rudolph W;Greenberg Traurig LLP;Trump, Donald J;Cohen, Michael D (1966- );United States Politics and Government;Legal Profession", type: "Article",  section: "World", byline: "By MICHAEL S. SCHMIDT and MAGGIE HABERMAN", title: "Giuliani’s Law Firm Undercuts His Statements as They Part Ways", abstract:"Rudolph W. Giuliani described hush-money payments like the ones made on behalf of President Trump as routine. Greenberg Traurig said it did not condone such arrangements.", publishedDate: "2018-05-17", source: "The New York Times", id: 100000005894313, assetID: 100000005894313, views: 2, desFacet: [], orgFacet: [], perFacet: [], geoFacet: [], media: media_1, publishedDateToSort:  date2),
        
        Article(url: "https://www.nytimes.com/2018/05/15/science/yanny-laurel.html", adxKeywords: "Iran;Nuclear Weapons;Trump, Donald J;United States International Relations;Embargoes and Sanctions;Europe;North Korea", type: "Article",  section: "World", byline: "By MARK LANDLER", title: "Trump Abandons Iran Nuclear Deal He Long Scorned", abstract: "Mr. Trump’s decision, while long anticipated and widely telegraphed, plunges America’s relations with European allies into deep uncertainty.", publishedDate: "2018-05-18", source: "The New York Times", id: 100000005888324, assetID: 100000005888324, views: 1, desFacet: [], orgFacet: [], perFacet: [], geoFacet: [], media: media_1, publishedDateToSort:  date3),
        Article(url: "https://www.nytimes.com/2018/05/10/us/politics/rudy-giuliani-resigns-law-firm-greenberg-traurig.html", adxKeywords: "Iran;Nuclear Weapons;Trump, Donald J;United States International Relations;Embargoes and Sanctions;Europe;North Korea", type: "Article",  section: "World", byline: "By MARK LANDLER", title: "Trump Abandons Iran Nuclear Deal He Long Scorned", abstract: "Mr. Trump’s decision, while long anticipated and widely telegraphed, plunges America’s relations with European allies into deep uncertainty.", publishedDate: "2018-05-19", source: "The New York Times", id: 100000005888324, assetID: 100000005888324, views: 1, desFacet: [], orgFacet: [], perFacet: [], geoFacet: [], media: media_1, publishedDateToSort:  date4),
        Article(url: "https://www.nytimes.com/2018/05/10/technology/alexa-siri-hidden-command-audio-attacks.html", adxKeywords: "Iran;Nuclear Weapons;Trump, Donald J;United States International Relations;Embargoes and Sanctions;Europe;North Korea", type: "Article", section: "World", byline: "By MARK LANDLER", title: "Trump Abandons Iran Nuclear Deal He Long Scorned", abstract: "Mr. Trump’s decision, while long anticipated and widely telegraphed, plunges America’s relations with European allies into deep uncertainty.", publishedDate: "2018-05-20", source: "The New York Times", id: 100000005888324, assetID: 100000005888324, views: 1, desFacet: [], orgFacet: [], perFacet: [], geoFacet: [], media: media_1, publishedDateToSort:  date5)
        
    ]
    
    private lazy var sortedArticles = [
        Article(url: "https://www.nytimes.com/2018/05/10/technology/alexa-siri-hidden-command-audio-attacks.html", adxKeywords: "Iran;Nuclear Weapons;Trump, Donald J;United States International Relations;Embargoes and Sanctions;Europe;North Korea", type: "Article", section: "World", byline: "By MARK LANDLER", title: "Trump Abandons Iran Nuclear Deal He Long Scorned", abstract: "Mr. Trump’s decision, while long anticipated and widely telegraphed, plunges America’s relations with European allies into deep uncertainty.", publishedDate: "2018-05-20", source: "The New York Times", id: 100000005888324, assetID: 100000005888324, views: 1, desFacet: [], orgFacet: [], perFacet: [], geoFacet: [], media: media_1, publishedDateToSort:  date5),
        Article(url: "https://www.nytimes.com/2018/05/10/us/politics/rudy-giuliani-resigns-law-firm-greenberg-traurig.html", adxKeywords: "Iran;Nuclear Weapons;Trump, Donald J;United States International Relations;Embargoes and Sanctions;Europe;North Korea", type: "Article",  section: "World", byline: "By MARK LANDLER", title: "Trump Abandons Iran Nuclear Deal He Long Scorned", abstract: "Mr. Trump’s decision, while long anticipated and widely telegraphed, plunges America’s relations with European allies into deep uncertainty.", publishedDate: "2018-05-19", source: "The New York Times", id: 100000005888324, assetID: 100000005888324, views: 1, desFacet: [], orgFacet: [], perFacet: [], geoFacet: [], media: media_1, publishedDateToSort:  date4),
        Article(url: "https://www.nytimes.com/2018/05/15/science/yanny-laurel.html", adxKeywords: "Iran;Nuclear Weapons;Trump, Donald J;United States International Relations;Embargoes and Sanctions;Europe;North Korea", type: "Article",  section: "World", byline: "By MARK LANDLER", title: "Trump Abandons Iran Nuclear Deal He Long Scorned", abstract: "Mr. Trump’s decision, while long anticipated and widely telegraphed, plunges America’s relations with European allies into deep uncertainty.", publishedDate: "2018-05-18", source: "The New York Times", id: 100000005888324, assetID: 100000005888324, views: 1, desFacet: [], orgFacet: [], perFacet: [], geoFacet: [], media: media_1, publishedDateToSort:  date3),
        Article(url: "https://www.nytimes.com/2018/05/10/us/politics/rudy-giuliani-resigns-law-firm-greenberg-traurig.html", adxKeywords: "Giuliani, Rudolph W;Greenberg Traurig LLP;Trump, Donald J;Cohen, Michael D (1966- );United States Politics and Government;Legal Profession", type: "Article",  section: "World", byline: "By MICHAEL S. SCHMIDT and MAGGIE HABERMAN", title: "Giuliani’s Law Firm Undercuts His Statements as They Part Ways", abstract:"Rudolph W. Giuliani described hush-money payments like the ones made on behalf of President Trump as routine. Greenberg Traurig said it did not condone such arrangements.", publishedDate: "2018-05-17", source: "The New York Times", id: 100000005894313, assetID: 100000005894313, views: 2, desFacet: [], orgFacet: [], perFacet: [], geoFacet: [], media: media_1, publishedDateToSort:  date2),
        Article(url: "https://www.nytimes.com/2018/05/08/world/middleeast/trump-iran-nuclear-deal.html", adxKeywords: "Iran;Nuclear Weapons;Trump, Donald J;United States International Relations;Embargoes and Sanctions;Europe;North Korea", type: "Article",  section: "World", byline: "By MARK LANDLER", title: "Trump Abandons Iran Nuclear Deal He Long Scorned", abstract: "Mr. Trump’s decision, while long anticipated and widely telegraphed, plunges America’s relations with European allies into deep uncertainty.", publishedDate: "2018-05-16", source: "The New York Times", id: 100000005888324, assetID: 100000005888324, views: 1, desFacet: [], orgFacet: [], perFacet: [], geoFacet: [], media: media_1, publishedDateToSort:  date1),

        ]
    
    private lazy var article = Article(url: "https://www.nytimes.com/2018/05/14/world/middleeast/gaza-protests-palestinians-us-embassy.html", adxKeywords: "Defense and Military Forces;Palestinians;Demonstrations, Protests and Riots;Politics and Government;Deaths (Fatalities);Diplomatic Service, Embassies and Consulates;Palestinian Authority;Mnuchin, Steven T;Kushner, Jared;Trump, Ivanka;Gaza Strip;Israel;Jerusalem (Israel);United States International Relations", type: "Article", section: "World", byline: "By DAVID M. HALBFINGER, ISABEL KERSHNER and DECLAN WALSH", title: "Israel Kills Dozens at Gaza Border as U.S. Embassy Opens in Jerusalem", abstract: "The relocation of the embassy from Tel Aviv, timed for Israel’s 70th anniversary, was celebrated by many Israelis and enraged Palestinians.", publishedDate: "2018-05-16", source: "The New York Times", id: 100000005899533, assetID: 100000005899533, views: 20, desFacet: [], orgFacet: [], perFacet: [], geoFacet: [], media: media_1, publishedDateToSort: date1)
    
    //MARK:- Get articles
    func getArticles()->[Article]{
        return articles
    }
    
    func getSortedArticles()->[Article]{
        return sortedArticles
    }
    
    func getArticle()->Article{
        return article
    }
}
