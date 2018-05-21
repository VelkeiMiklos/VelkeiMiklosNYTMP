//
//  DateConverterHelper.swift
//  VelkeiMiklosNYTMP
//
//  Created by Velkei Miklós on 2018. 05. 18..
//  Copyright © 2018. NeonatCore. All rights reserved.
//

import Foundation

public class DateConverterHelper{
    static  func stringDateConvertoToDate(date: String)-> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let publishedDateToSort = dateFormatter.date(from: date)
        return publishedDateToSort!
    }
}
