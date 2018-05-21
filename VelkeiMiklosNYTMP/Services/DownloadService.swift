//
//  DownloadService.swift
//  VelkeiMiklósWUP
//
//  Created by Velkei Miklós on 2018. 05. 14..
//  Copyright © 2018. NeonatCore. All rights reserved.
//

import UIKit
import Alamofire

class DownloadServices{
    
    static let instance = DownloadServices()

    func downloadArticles(urlPeriod: Int, completion: @escaping (_ success: Bool, _ articleArray: [Article]?, _ error: Error?)-> ()){

        var articleArray = [Article]()
        var url = ""
        var adxKeywords = ""
        var type = ""
        var section = ""
        var byline = ""
        var title = ""
        var abstract = ""
        var source = ""
        var publishedDate = ""
        var id = 0
        var assetID = 0
        var views = 0
        var media: Media!
        var desFacet = [String]()
        var orgFacet = [String]()
        var perFacet = [String]()
        var geoFacet = [String]()
        var media_type = ""
        var media_subtype = ""
        var media_caption = ""
        var media_copyright = ""
        var media_approvedForSyndication = 0
        var mediaMetadataArray = [MediaMetadata]()
        var mediaMetadataURL = ""
        var mediaMetadataFormat = ""
        var mediaMetadataHeight = 0
        var mediaMetadataWidth = 0

        let header = [
            Header.CONTENT_TYPE: Header.APPLICATION
        ]
        
        //Get url by period
        let urlByPeriod = URLHelper.articlesURL(withPeriod: urlPeriod)
        guard let finalUrl = URL(string: urlByPeriod ) else{
            return
        }
        
        Alamofire.request(finalUrl, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            if response.result.error == nil{
                
                //print(response)
                guard let json = response.result.value as? Dictionary<String,AnyObject> else { return }
                // print(json)
                if let resultsJSON = json[JSONConstant.RESULT] as? [Dictionary<String,AnyObject>]{

                    for result in resultsJSON{
                        // print(result)
                        
                        if let urlJSON = result[JSONConstant.URL] as? String {
                            url = urlJSON
                        }
                        
                        if let adxKeywordsJSON = result[JSONConstant.ADX_KEYWORDS] as? String {
                            adxKeywords = adxKeywordsJSON
                        }
                        
                        if let typeJSON = result[JSONConstant.TYPE] as? String{
                            type = typeJSON
                        }
                        
                        if let sectionJSON = result[JSONConstant.SECTION] as? String{
                            section = sectionJSON
                        }
                        
                        if let byLineJSON = result[JSONConstant.BY_LINE] as? String{
                            byline = byLineJSON
                        }
                        
                        if let titleJSON = result[JSONConstant.TITLE] as? String{
                            title = titleJSON
                        }
                        
                        if let abstractJSON = result[JSONConstant.ABSTRACT] as? String{
                            abstract = abstractJSON
                        }
                        
                        if let publishedDateJSON = result[JSONConstant.PUBLISHED_DATE] as? String{
                            publishedDate = publishedDateJSON
                            
                        }
                        
                        if let publishedDateJSON = result[JSONConstant.PUBLISHED_DATE] as? String{
                            publishedDate = publishedDateJSON
                        }
                        
                        if let sourceJSON = result[JSONConstant.SOURCE] as? String{
                            source = sourceJSON
                        }
                        
                        if let idJSON = result[JSONConstant.ID] as? Int{
                            id = idJSON
                        }
                        
                        if let assetIdJSON = result[JSONConstant.ASSET_ID] as? Int{
                            assetID = assetIdJSON
                        }
                        
                        if let viewsJSON = result[JSONConstant.VIEWS] as? Int{
                            views = viewsJSON
                        }
                        
                        if let desFacetJSON = result[JSONConstant.DES_FACET] as? [String]{
                            desFacet = desFacetJSON
                        }
                        
                        if let orgFacetJSON = result[JSONConstant.ORG_FACET] as? [String]{
                            orgFacet = orgFacetJSON
                        }
                        
                        if let perFacetJSON = result[JSONConstant.PER_FACET] as? [String]{
                            perFacet = perFacetJSON
                        }
                        
                        if let geoFacetJSON = result[JSONConstant.GEO_FACET] as? [String]{
                            geoFacet = geoFacetJSON
                        }
                        
                        //Get media datas
                        if let mediaJSONList = result[JSONConstant.MEDIA] as? [Dictionary<String,AnyObject>]{
                            for mediaJSON in mediaJSONList{
                                
                                if let mediaTypeJSON = mediaJSON[JSONConstant.TYPE] as? String{
                                    media_type = mediaTypeJSON
                                }
                                
                                if let mediaSubTypeJSON = mediaJSON[JSONConstant.SUBTYPE] as? String{
                                    media_subtype = mediaSubTypeJSON
                                }
                                
                                if let mediaCaptionJSON = mediaJSON[JSONConstant.CAPTION] as? String{
                                    media_caption = mediaCaptionJSON
                                }
                                
                                if let mediaCopyRightJSON = mediaJSON[JSONConstant.COPYRIGHT] as? String{
                                    media_copyright = mediaCopyRightJSON
                                }
                                
                                if let mediaApprovedForSyndicationJSON = mediaJSON[JSONConstant.APPROVED_FOR_SYNDICATION] as? Int{
                                    media_approvedForSyndication = mediaApprovedForSyndicationJSON
                                }
                                
                                //Get MetaData-s
                                if let mediaMetaDataJSONList = mediaJSON[JSONConstant.MEDIA_METADATA] as? [Dictionary<String,AnyObject>]{
                                    for mediaMetadaDataJSON in mediaMetaDataJSONList{
                                        
                                        if let mediaMetadaDataJSONURL = mediaMetadaDataJSON[JSONConstant.URL] as? String{
                                            mediaMetadataURL = mediaMetadaDataJSONURL
                                        }
                                        
                                        if let mediaMetadaDataJSONFormat = mediaMetadaDataJSON[JSONConstant.FORMAT] as? String{
                                            mediaMetadataFormat = mediaMetadaDataJSONFormat
                                        }
                                        
                                        if let mediaMetadaDataJSONWidth = mediaMetadaDataJSON[JSONConstant.WIDTH] as? Int{
                                            mediaMetadataWidth = mediaMetadaDataJSONWidth
                                        }
                                        
                                        if let mediaMetadaDataJSONHeight = mediaMetadaDataJSON[JSONConstant.HEIGHT] as? Int{
                                            mediaMetadataHeight = mediaMetadaDataJSONHeight
                                        }
                                        
                                        let mediaMetaData = MediaMetadata(url: mediaMetadataURL, format: mediaMetadataFormat, height: mediaMetadataWidth , width: mediaMetadataHeight)
                                        mediaMetadataArray.append(mediaMetaData)
                                    }
                                }
                                media = Media(type: media_type, subtype: media_subtype, caption: media_caption, copyright: media_copyright, approvedForSyndication: media_approvedForSyndication, mediaMetadata: mediaMetadataArray)
                                mediaMetadataArray.removeAll()
                            }
                        }
                        //Sort date
                        let publishedDateToSort = DateConverterHelper.stringDateConvertoToDate(date: publishedDate)
                        let article = Article(url: url, adxKeywords: adxKeywords, type: type, section: section, byline: byline, title: title, abstract: abstract, publishedDate: publishedDate, source: source, id: id, assetID: assetID, views: views, desFacet: desFacet, orgFacet: orgFacet, perFacet: perFacet, geoFacet: geoFacet, media: media, publishedDateToSort: publishedDateToSort)
                        articleArray.append(article)
                    }
                    completion(true, articleArray, nil)
                }else{
                    debugPrint(response.result.error as Any)
                    completion(false, articleArray, response.error)
                }
            }
        }
    }
}
