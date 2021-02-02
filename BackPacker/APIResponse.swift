//
//  APIResponse.swift
//  BackPacker
//
//  Created by 심현지 on 2021/01/29.
//

import Foundation

struct APIResponse<T : Decodable> : Decodable {
    
    let resultCount : Int
    let results : Array<T>
}
