//
//  ApiService.swift
//  KazemaGlobal
//
//  Created by Srishti on 16/11/20.
//  Copyright © 2020 Chitra S R. All rights reserved.
//

import Foundation
import Alamofire
import Photos

class ApiService{
    static let sharedInstance = ApiService()
    var isTaskRunning = Bool()
    var progressHandler: ((_ isRunning:Bool,_ progress:Progress?,_ error:Error?) -> Void)?
    typealias completionHandler = (_ status:Bool, _ result:AnyObject?,_ error:NSError?)->Void
    typealias progressClosure = (_ status:Progress)->Void
    private  init ()
    {
        
    }
    
    static func sendEnquiries(param:[String:Any]?,completion:@escaping completionHandler){
        let decoder = JSONDecoder()
        ServiceManager.sharedInstance.postMethod(Service.kSendEnquiries, parameter: param) { (status, result, error) in
            if status
            {
                let data = result?.data
                do{
                    let responseData = try decoder.decode(SendEnquiresBase.self, from: data!)
                    //UserBase.currentUser = responseData
                    
                    completion(true,responseData as AnyObject,nil)
                }catch let error {
                    print(error)
                    completion(false,nil,error as NSError)
                }
            }
            else
            {
                completion(status,nil,error)
            }
            
        }
    }
}
