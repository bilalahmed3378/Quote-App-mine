//
//  GetQuotesByCategoryResponseModel.swift
//  Quote App
//
//  Created by Bilal Ahmed on 30/03/2023.
//

import Foundation


struct GetQuotesByCategoryResponseModel : Codable {
    
    let message : String
    let docs : [GetQuotesByCategoryDocsModel]
    let showingFrom: Int
    let showingTo : Int
    let currentPageNumber : Int
    let previousPageNumber : Int
    let nextPageNumber: Int
    let limit : Int
    let previousPage : Bool
    let nextPage : Bool
    let totalDocs : Int
    let totalPages : Int
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do{
            totalDocs = try container.decode(Int?.self, forKey: .totalDocs) ?? 0
        } catch{
            totalDocs = 0
        }
        
        do{
            totalPages = try container.decode(Int?.self, forKey: .totalPages) ?? 0
        } catch{
            totalPages = 0
        }
        
        do{
            nextPage = try container.decode(Bool?.self, forKey: .nextPage) ?? false
        } catch{
            nextPage = false
        }
        
        do{
            previousPage = try container.decode(Bool?.self, forKey: .previousPage) ?? false
        } catch{
            previousPage = false
        }
        
        do{
            limit = try container.decode(Int?.self, forKey: .limit) ?? 0
        } catch{
            limit = 0
        }
        
        do{
            nextPageNumber = try container.decode(Int?.self, forKey: .nextPageNumber) ?? 0
        } catch{
            nextPageNumber = 0
        }
        
        do{
            previousPageNumber = try container.decode(Int?.self, forKey: .previousPageNumber) ?? 0
        } catch{
            previousPageNumber = 0
        }
        
        do{
            currentPageNumber = try container.decode(Int?.self, forKey: .currentPageNumber) ?? 0
        } catch{
            currentPageNumber = 0
        }
        
        do{
            showingTo = try container.decode(Int?.self, forKey: .showingTo) ?? 0
        } catch{
            showingTo = 0
        }
      
        do{
            showingFrom = try container.decode(Int?.self, forKey: .showingFrom) ?? 0
        } catch{
            showingFrom = 0
        }
      
        do{
            message = try container.decode(String?.self, forKey: .message) ?? ""
        } catch{
            message = ""
        }
        
        do{
            docs = try container.decode([GetQuotesByCategoryDocsModel]?.self, forKey: .docs) ?? []
        } catch{
            docs = []
        }
        
    }
    
}





struct GetQuotesByCategoryDocsModel : Codable {
    
  
  
  
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


