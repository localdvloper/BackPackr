//
//  ITunesData.swift
//  BackPacker
//
//  Created by 심현지 on 2021/02/01.
//

import Foundation

struct ITunesData : Decodable {
    
    let trackName : String
    
    let screenshotUrls : Array<String>
    
    let fileSizeBytes : String
    let version : String
    let releaseNotes : String
    
    let description : String
    
    let genres : Array<String>
}
