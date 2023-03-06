import Foundation

public struct LineNotificationSender {
    private let _apiKey: String
    private let _dispatchGroup: DispatchGroup
    
    public init(apiKey: String, dispatchGroup: DispatchGroup) {
        _apiKey = apiKey
        _dispatchGroup = dispatchGroup
    }
    
    // It encodes passed string.
    func notify(message: String) {
        let url = URL(string: "https://notify-api.line.me/api/notify")!
        
        let charset = CharacterSet.alphanumerics.union(.init(charactersIn: "/?-._~"))
        let messageRemovedPercentEncoding = message.removingPercentEncoding ?? message
        let messageAddedPercentEncoding = messageRemovedPercentEncoding.addingPercentEncoding(withAllowedCharacters: charset) ?? messageRemovedPercentEncoding
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(_apiKey)", forHTTPHeaderField: "Authorization")
        request.httpBody = "message=\(messageAddedPercentEncoding)".data(using: .utf8)
        _dispatchGroup.enter()

        URLSession.shared.dataTask(with: request, completionHandler: {_,_,_  in
            _dispatchGroup.leave()
            }
        ).resume()
    }
}
