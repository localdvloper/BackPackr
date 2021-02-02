//
//  RootViewModel.swift
//  BackPacker
//
//  Created by 심현지 on 2021/01/31.
//

import Foundation
import Alamofire

protocol RootViewModelDelegate {
    func fetchDidComplete(result: Bool, data: ITunesData?)
}

class RootViewModel {
    
    let ITUNES_URL_STR = "http://itunes.apple.com/lookup?id=872469884"
    
    init(delegate: RootViewModelDelegate) {
        fetchData(delegate: delegate)
    }
    
    /// ITUnes에서 API통신을 통해 화면에 나타날 데이터를 가져온다.
    func fetchData(delegate: RootViewModelDelegate) {
        
        AF.request(ITUNES_URL_STR).responseDecodable(of: APIResponse<ITunesData>.self) { response in
                        
            switch response.result {
            case .success(let result):
                
                /// 데이터를 성공적으로 가져왔으면 delegate 메소드를 호출한다.
                delegate.fetchDidComplete(result: true, data: result.results.first)

            case .failure(let error):
                print(error.localizedDescription)
                delegate.fetchDidComplete(result: false, data: nil)
            }
        }
        
    }
}
