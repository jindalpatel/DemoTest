//
//  SecondViewController.swift
//  PasswordEncryption
//
//  Created by Pradumna Bajoria on 18/04/22.
//

import UIKit
import Security
import SwiftyRSA
import CryptoKit

class SecondViewController: UIViewController,UITextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
                
        let pubKey = "-----BEGIN PUBLIC KEY-----\n" +
        "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDVWuxDFwSRXdvVfwYBRsYoqlOT\n" +
        "xSAmgV5Y5x5SqMm7/z01fluhfXe4c1wK/680GdgBe4YgluU54Ra/A/54rb85SYsH\n" +
        "GBD3kSwen3f4zOs/uNvgA+O8jzVikFuR/nzJpS9k9OdvP6xiryVwGapzhpq/bl+O\n" +
        "8CRW4xTtoEZ+JhLfqwIDAQAB\n" +
        "-----END PUBLIC KEY-----";

        let converter = RSAUtilsWrapper()
        let secKey = try? converter.addRSAPublicKey(pubKey, tagName: "")

        let plainData = "Crest@123".data(using: .utf8)
        if let encryptedMessageData:Data = SecKeyCreateEncryptedData(secKey!, .rsaEncryptionOAEPSHA256, plainData! as CFData,nil) as Data?{
            print(encryptedMessageData.base64EncodedString())
        }
        else{
            print("Error encrypting")
        }
        
    }
    
    func getMyLeaveBalanceData(completion: @escaping (String,String) -> ())
    {
            completion("", "")
    }

}
