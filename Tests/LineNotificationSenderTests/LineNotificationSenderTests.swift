import XCTest
@testable import LineNotificationSender

final class LineNotificationSenderTests: XCTestCase {
    func testCanInit() throws {
        XCTAssertNotNil(LineNotificationSender.init(apiKey: "test", dispatchGroup: DispatchGroup()))
    }
}
