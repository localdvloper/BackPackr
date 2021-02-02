//
//  Screenshot.swift
//  BackPacker
//
//  Created by 심현지 on 2021/01/29.
//

import Foundation

class Screenshot {
    
    var url : URL?
    
    init(urlStr : String) {
        
        self.url = URL(string: urlStr)
    }
}
