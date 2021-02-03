//
//  DetayAramaVM.swift
//  SignumApp
//
//  Created by Salih Erkan Sandal on 3.02.2021.
//

import Foundation
final class DetayAramaVM {
    
    var detaylar: DetayResponseModel?
    var verileriYenile: (() -> ())?
    var idCekk : String?
    
    func veriCek() {

        let headers = [
            "x-rapidapi-key": "2ad21acbcamsh1f26a2fd56c82eap1f2837jsnf1611fdfc78f",
            "x-rapidapi-host": "movie-database-imdb-alternative.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://movie-database-imdb-alternative.p.rapidapi.com/?i=\(idCekk ?? "")&r=json")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let responseObject = try decoder.decode(DetayResponseModel.self, from: data)
                    self.detaylar = responseObject
                    self.verileriYenile?()
                }catch {
                    print(error)
                }
            }
        })

        dataTask.resume()
    }
}
