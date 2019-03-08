//
//  Global.swift
//  JobFinder
//
//  Created by Yasin on 3/5/19.
//  Copyright © 2019 Yasin. All rights reserved.
//

import Foundation

public enum Provider {
    case github
    case searchGov
}

extension String{

    // to convert StringDate to StringDate  with deferent format
    func convertDateFormatter(format:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format //this your string date format
        dateFormatter.locale = Locale(identifier: "your_loc_id")
        let convertedDate = dateFormatter.date(from: self)
        
        guard dateFormatter.date(from: self) != nil else {
            return ""
        }
        
        dateFormatter.dateFormat = "dd/MM/yyyy" //this is what you want to convert format
        let timeStamp = dateFormatter.string(from: convertedDate!)
        
        return timeStamp
    }
}
