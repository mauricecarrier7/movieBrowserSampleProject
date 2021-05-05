//
//  ImageResponseModel.swift
//  MovieBrowser
//
//  Created by Maurice Carrier on 5/4/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation
import UIKit

class ImageResponseModel: Codable {
    var imageData: Data
    
    init(data: Data) {
        self.imageData = data
    }
    
    func image() -> UIImage? {
        UIImage(data: imageData)
    }
}
