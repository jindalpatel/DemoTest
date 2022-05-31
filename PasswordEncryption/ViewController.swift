//
//  ViewController.swift
//  PasswordEncryption
//
//  Created by Pradumna Bajoria on 14/04/22.
//

import UIKit
import SwiftyRSA
import CryptoKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        fileprivate var pbKey = """
//                                WCPnwEypzzhyXDeD5A425TwW/+FeCc4b1Qxt5vOdmNuF3TkwoJiXes2YE379HWw4T4mDVnXfUYPq0DpmIfImx80dnhYY8meh/rB+mqM4UwVNj1IlE6rI6oDn2sLJh3ty+FYyT1nCebk/4FzCOo0LGRA6TZXBZ1pxAQlYlQ06SVbuBt+kDZ034FbWTmHEi5uZ7GJmHkRrSAxQku9bvGy66daGqAjA8hr/czyrU+Rrb521LviZWZi81fzuSxD1QuGiEN0NNtZ/+1DiNYq7bf2ThhM3LAnwJWmd0rB9csJv8LCiGqXVTaLQISKZUC30w6boYc3HIcakIEw58DZqZQUO9A==
//                                """
//
//        // Then you use that public key in your pem file
//        let publicKey = try PublicKey(pemEncoded: pbKey)
//        let clear = try ClearMessage(string: "Clear Text", using: .utf8)
//        let encrypted = try clear.encrypted(with: publicKey, padding: .OAEP)
        
//        let publicKey = try PublicKey(pemNamed: "public")
//        let clear = try ClearMessage(string: "Clear Text", using: .utf8)
//        let encrypted = try clear.encrypted(with: publicKey, padding: .PKCS1)
//
//        // Then you can use:
//        let data = encrypted.data
//        let base64String = encrypted.base64String
        
        let string = "Hello Swift!"
        let data = Data(string.utf8)
        let digest = SHA256.hash(data: data)
        let hash = digest.compactMap { String(format: "%02x", $0) }.joined()
        print(hash)

        // AES
        let key = SymmetricKey(size: .bits256)
        let message = "Hello Swift!".data(using: .utf8)!
        let sealedBox = try! AES.GCM.seal(message, using: key)

        let decryptedData = try? AES.GCM.open(sealedBox, using: key)
        print(String(data: decryptedData ?? Data(), encoding: .utf8) ?? "")
        
    }


}

