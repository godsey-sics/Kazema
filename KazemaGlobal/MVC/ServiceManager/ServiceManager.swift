//
//  ServiceManager.swift
//  KazemaGlobal
//
//  Created by Srishti on 16/11/20.
//  Copyright © 2020 Chitra S R. All rights reserved.
//

import UIKit
import Alamofire

class ServiceManager: NSObject {
   static let sharedInstance = ServiceManager()
    typealias completionHandler = (_ status:Bool, _ result:DataResponse<Any>?,_ error:NSError?)->Void

    public var sessionManager: Alamofire.SessionManager // most of your web service clients will call through sessionManager
    public var backgroundSessionManager: Alamofire.SessionManager // your web services you intend to keep running when the system backgrounds your app will use this
    private override init() {
        self.sessionManager = Alamofire.SessionManager(configuration: URLSessionConfiguration.default)
        self.backgroundSessionManager = Alamofire.SessionManager(configuration: URLSessionConfiguration.background(withIdentifier: "com.sics.sportdare.backgroundtransfer"))
    }
    
    //MARK: POST
    
   
//    func postMethodAlamofire_With_Multiple_Data(_ serviceName : String, with dictionary : NSDictionary,imagedatas:[String:Data]?, completion : @escaping (Bool, AnyObject?, NSError?) -> Void)
//    {
//        upload(multipartFormData: { (multipartFormData) in
//            for (key,data) in imagedatas!
//            {
//                multipartFormData.append(data, withName: key , fileName:"\( Utilities.makeFileName()).png", mimeType: "image/jpeg")
//               
//            }
//           
//            for (key, value) in dictionary {
//                multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key as! String)
//            }
//        }, to:"\(kBaseUrl)"+"\(serviceName)")
//        { (result) in
//            switch result {
//            case .success(let upload, _, _):
//                upload.uploadProgress(closure: { (progress) in
//                    //Print progress
//                    print(progress)
//                })
//                upload.responseJSON { response in
//                    if response.error == nil{
//                        completion(true, response.result.value as AnyObject , nil)
//                    }else
//                    {
//                        completion(false, response.result.value as AnyObject, response.error! as NSError)
//                    }
//                }
//            case .failure(let encodingError):
//                completion(false, nil, encodingError as NSError)
//            }
//        }
//        
//    }
    
    
    
    
    func postMethod(_ service : String, parameter:[String:Any]? ,completion :@escaping completionHandler)
    {
        let headers = ["Content-Type":"application/x-www-form-urlencoded"]
        request("\(kBaseUrl)"+"\(service)", method: .post, parameters: parameter, encoding: URLEncoding.httpBody, headers: headers).responseJSON { (response) in
            switch response.result {
            case .success(let jsonData):
                print("Success with JSON: \(jsonData)")
                let dictionary = jsonData as! NSDictionary
                let status:Bool = dictionary.object(forKey: "status") as! Bool
                if(status){
                      completion(true,response,nil)
                }else{
                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : dictionary.value(forKey: "message")! as! String])
                    let response = dictionary.value(forKey: "message")! as? String
                    
                   completion(false,nil,error)
                }
                
            case .failure(let error):
                completion(false, nil, error as NSError)
            }
        }
    }
    
   
    
    //MARK: GET
    func getMethodAlamofire(_ url : String, completion :@escaping completionHandler)
    {

        request(url).responseJSON(completionHandler: { (response) in
            switch response.result {
            case .success( _):
                completion(true, response , nil)
                
            case .failure(let error):
                completion(false, nil, error as NSError)
            }
        })
        
    }
   
   

}

