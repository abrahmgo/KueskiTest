//
//  PopularMoviesEndpoint.swift
//  APICore
//
//  Created by Andrés Bonilla Gómez on 23/03/24.
//

import CoreEntities
import NetworkCore
import Alamofire
import Utils

enum PopularMoviesEndpoint: NetworkTargetType {
    
    case service(model: PopularMoviesRequest)
    
    var baseURL: String {
        return NetworkCoreAPIConfig.shared.baseURL
    }
    
    var path: String {
        return ""
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var sampleData: Data? {
        let bundle = CoreRemoteDataSource.bundle
        let sampleData = NetworkCoreSampleData(bundle: bundle)
        
        return sampleData.getData(for: "PopularMovies")
    }
    
    var parameters: Parameters? {
        switch self {
        case .service(let model):
            var param = ["include_adult": model.includeAdult.description,
                         "include_video": model.includeVideo.description,
                         "language": model.language.rawValue,
                         "page": "\(model.page)",
                         "sort_by": model.sort.rawValue]
            if let minDate = model.minDate,
               let maxDate = model.maxDate {
                param["with_release_type"] =  "2|3"
                param[ "release_date.gte"] = minDate.toSring(format: .middleDash)
                param["release_date.lte"] = maxDate.toSring(format: .middleDash)
            }
            return param
        }
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.queryString
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
