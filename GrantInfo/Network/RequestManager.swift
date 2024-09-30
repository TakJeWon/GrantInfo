//
//  RequestManager.swift
//  GrantInfo
//
//  Created by 탁제원 on 9/30/24.
//

import Foundation

class RequestManager {
    
    let basicUrl = "https://api.odcloud.kr/api/gov24/"
    let versionCode = "v3"
    let authKey = ""
    
    let networkManager: NetworkManager = NetworkManager()
    
    func getServiceList(page: Int, perPage: Int){
        
        var url = basicUrl + versionCode + "/serviceList"
        
        var charSet = CharacterSet.urlQueryAllowed
        charSet.insert("%")
        
        var queryString = ""
        queryString.append(String(format: "?page=%d", page))
        queryString.append(String(format: "&perPage=%d", perPage))
        queryString.append(String(format: "&serviceKey=%@", authKey))
        
        print("url : \(queryString)")
        print("url encoded with allowed : \(queryString.addingPercentEncoding(withAllowedCharacters: charSet) ?? "")")
        
        url.append(queryString.addingPercentEncoding(withAllowedCharacters: charSet) ?? "")
        
        networkManager.get(url, { response in
            print(response)
        })
    }
}
