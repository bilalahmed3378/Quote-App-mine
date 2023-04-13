//
//  QuoteOfTheDayResponseModel.swift
//  Quote App
//
//  Created by Bilal Ahmed on 02/04/2023.
//

import Foundation


struct QuoteOfTheDayResponseModel : Codable {
    
    let message : String
    let docs : QuoteOfTheDayDocsModel?
 
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
      
        do{
            message = try container.decode(String?.self, forKey: .message) ?? ""
        } catch{
            message = ""
        }
        
        do{
            docs = try container.decode(QuoteOfTheDayDocsModel?.self, forKey: .docs) ?? nil
        } catch{
            docs = nil
        }
        
    }
    
}





struct QuoteOfTheDayDocsModel : Codable {
    
      
    let _id : String
    let quote : String
    let category : String
    let createdAt : String

    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
      
      
        do{
            _id = try container.decode(String?.self, forKey: ._id) ?? ""
        } catch{
            _id = ""
        }
        
        do{
            quote = try container.decode(String?.self, forKey: .quote) ?? ""
        } catch{
            quote = ""
        }
        
        do{
            category = try container.decode(String?.self, forKey: .category) ?? ""
        } catch{
            category = ""
        }
        
        do{
            createdAt = try container.decode(String?.self, forKey: .createdAt) ?? ""
        } catch{
            createdAt = ""
        }
        
      
        
        
      
    }
    
}
