//
//  ContactUsResponseModel.swift
//  Quote App
//
//  Created by Bilal Ahmed on 02/04/2023.
//

import Foundation

struct ContactUsResponseModel : Codable {
    
    let message : String
    let docs : ContactUsDocsModel?
 
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
      
        do{
            message = try container.decode(String?.self, forKey: .message) ?? ""
        } catch{
            message = ""
        }
        
        do{
            docs = try container.decode(ContactUsDocsModel?.self, forKey: .docs) ?? nil
        } catch{
            docs = nil
        }
        
    }
    
}

struct ContactUsDocsModel : Codable {
    
    let message : String
    let name : String
    let email : String
    let whatsapp : Int


  
 
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
      
        do{
            message = try container.decode(String?.self, forKey: .message) ?? ""
        } catch{
            message = ""
        }
        
        do{
            name = try container.decode(String?.self, forKey: .name) ?? ""
        } catch{
            name = ""
        }
        
        do{
            email = try container.decode(String?.self, forKey: .email) ?? ""
        } catch{
            email = ""
        }
        
        
        do{
            whatsapp = try container.decode(Int?.self, forKey: .whatsapp) ?? 0
        } catch{
            whatsapp = 0
        }
        
     
        
    }
    
}




