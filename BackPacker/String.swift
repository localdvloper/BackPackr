//
//  String.swift
//  BackPacker
//
//  Created by 심현지 on 2021/02/01.
//

import UIKit

extension String {
    
    func toMegaByteString() -> String {
        
        if let bytes = Int(self) {
            
            return String(format: "%.1f MB",  CGFloat(bytes / 1024 / 1024))
        }
        else {
            return ""
        }
        
    }
}
