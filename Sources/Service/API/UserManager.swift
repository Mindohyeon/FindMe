import Foundation

struct UserManager: Codable {
    var accessToken: String
    var refreshToken: String
    var expiredAt: String
}
