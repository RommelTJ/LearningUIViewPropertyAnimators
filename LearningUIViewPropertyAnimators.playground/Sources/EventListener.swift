import Foundation

public class EventListener: NSObject {
    public var eventFired: (() -> ())?
    
    @objc public func handleEvent() {
        eventFired?()
    }
}
