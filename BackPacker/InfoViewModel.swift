//
//  InfoTableViewModel.swift
//  BackPacker
//
//  Created by 심현지 on 2021/02/01.
//

import UIKit

class InfoViewModel {
    
    let title: String
    let description: String
    
    let detail: String?
    var isCollapsed: Bool
    
    init(title: String, description: String, detail: String? = nil, isCollapsed: Bool = true) {
        
        self.title = title
        self.description = description
        self.detail = detail
        self.isCollapsed = isCollapsed
    }
    
}

