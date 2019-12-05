import UIKit

enum log {
    case ln(_: String)
    case url(_: String)
    case error(_: NSError)
    case date(_: NSDate)
    case obj(_: AnyObject)
    case any(_: Any)
}

postfix operator /

postfix func / (target: log?) {
    guard let target = target else { return }

    func log<T>(_ emoji: String, _ object: T) {
        print("\(emoji) \(object)")
    }

    switch target {
    case let .ln(line):
        log("✏️", line)

    case let .url(url):
        log("🌏", url)

    case let .error(error):
        log("❗️", error)

    case let .any(any):
        log("⚪️", any)

    case let .obj(obj):
        log("◽️", obj)

    case let .date(date):
        log("🕒", date)
    }
}

let string = "Hello, world!"
let url = "http://www.andyyhope.com"
let date = NSDate()
let any = ["Key": 2]

log.ln("Pretty")/
log.url(url)/
log.date(date)/

log.any(UIColor.red)/
log.error(NSError(domain: "www.bing.com", code: 400, userInfo: ["key": "v"]))/
