//
//  URLHelper.swift
//  VelkeiMiklosNYTMP
//
//  Created by Velkei Miklós on 2018. 05. 15..
//  Copyright © 2018. NeonatCore. All rights reserved.
//

import Foundation

public class URLHelper{
    static  func articlesURL(withPeriod period: Int) -> String{
        let url =  "\(API.URL_BASE)\(period)\(API.JSON_API_KEY)\(API.API_KEY)"
        print(url)
        return url
    }
}
