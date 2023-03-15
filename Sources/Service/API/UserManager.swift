import Foundation

struct UserManager: Codable {
    var id: String
    var accessToken: String?
    var refreshToken: String?
    var expiredAt: String?
}
