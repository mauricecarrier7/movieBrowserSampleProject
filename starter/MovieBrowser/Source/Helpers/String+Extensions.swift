//
//  String+Extensions.swift
//  MovieBrowser
//
//  Created by Maurice Carrier on 5/5/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation


extension String {
    
    /**
     Formats date string in the form: December 31, 2021
     
     - Returns: String in the form: December 31, 2021
     */
    func longDateFormat() -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-mm-dd"
        guard let date = formatter.date(from: self) else { return nil }
        formatter.dateFormat = "MMMM dd, yyyy"
        return formatter.string(from: date)
    }
    
    /**
     Formats date string in the form: 5/25/77
     
     - Returns: String in the form: December 31, 2021
     */
    func shortDateFormat() -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-mm-dd"
        guard let date = formatter.date(from: self) else { return nil }
        formatter.dateFormat = "m/d/yy"
        return formatter.string(from: date)
    }
}
