import Foundation

struct APIConstants {
    static let baseURL = "https://port-0-findme-server-1ih8d2gld1eleat.gksl2.cloudtype.app"
    
    //SignIn
    static let signInURL = baseURL + "/auth/signin"
    
    //SignUp
    static let signUpURL = baseURL + "/auth/signup"
    static let sendPhoneNumberURL = baseURL + "/auth/send"
    static let checkCertificationNumberURL = baseURL + "/auth/check"
    static let getAddress = "https://business.juso.go.kr/addrlink/addrLinkApi.do"
    
    //reissue
    static let reissueURL = baseURL + "/reissue"
    
    //lost
    static let findAllPost = baseURL + "/lost/findAll"
    
    private init() { }
}
