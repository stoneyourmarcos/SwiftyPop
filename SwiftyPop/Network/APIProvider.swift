import Foundation
import Moya

// MARK: Provider Setup

let endpointClosure = { (target: WebService) -> Endpoint<WebService> in
    
    let url = target.baseURL.appendingPathComponent(target.path).absoluteString
    return Endpoint(url: url,
                    sampleResponseClosure: {
                        .networkResponse(200, target.sampleData)},
                    method: target.method,
                    parameters: target.parameters)
}

let requestClosure = { (endpoint: Endpoint<WebService>,
                        done: MoyaProvider.RequestResultClosure) in
    var request = endpoint.urlRequest! as URLRequest
    done(.success(request))
}

let apiProvider = MoyaProvider<WebService>(
            endpointClosure: endpointClosure,
            requestClosure: requestClosure)

