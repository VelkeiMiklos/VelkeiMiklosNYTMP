//
//  Article.swift
//  VelkeiMiklósWUP
//
//  Created by Velkei Miklós on 2018. 05. 14..
//  Copyright © 2018. NeonatCore. All rights reserved.
//

import Foundation

struct Article{
    
    public private(set) var url, adxKeywords, type, section, byline, title, abstract, publishedDate : String
    public private(set) var column: String?
    public private(set) var id, assetID, views: Int
    public private(set) var desFacet, orgFacet, perFacet, geoFacet: [String]
    public private(set) var media: [Media]
    
    init(url:String, adxKeywords: String, type: String, column: String, section: String, byline: String, title: String, abstract: String, publishedDate: String, id: Int, assetID: Int, views: Int, desFacet: [String] , orgFacet: [String] , perFacet: [String], geoFacet: [String], media: [Media]) {
        self.url = url
        self.adxKeywords = adxKeywords
        self.type = type
        self.section = section
        self.byline = byline
        self.title = title
        self.abstract = abstract
        self.publishedDate = publishedDate
        self.column = column
        self.id = id
        self.assetID = assetID
        self.views = views
        self.desFacet = desFacet
        self.orgFacet = orgFacet
        self.perFacet = perFacet
        self.geoFacet = geoFacet
        self.media = media
    }
}

struct Media{
    public private(set) var type, subtype, caption, copyright: String
    public private(set) var approvedForSyndication: Int
    public private(set) var mediaMetadata: [MediaMetadata]
    
    init(type: String, subtype: String, caption: String, copyright: String, approvedForSyndication: Int, mediaMetadata: [MediaMetadata] ) {
        self.type = type
        self.subtype = subtype
        self.caption = caption
        self.copyright = copyright
        self.approvedForSyndication = approvedForSyndication
        self.mediaMetadata = mediaMetadata
    }
}

struct MediaMetadata {
    public private(set) var url: String
    public private(set) var format: String
    public private(set) var height, width: Int
    
    init(url:String, format: String, height: Int, width: Int ) {
        self.url = url
        self.format = format
        self.height = height
        self.width = width
    }
    
}
