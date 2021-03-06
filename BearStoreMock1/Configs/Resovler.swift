//
//  Resovler.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-01.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    
  public static func registerAllServices() {
      
      // provide a singleton of Repository
      register { FirestoreRepository<Bear>() }.scope(.application)
      
      // View Models
      register { BearViewModel() }.scope(.application)
    
      // provide a singleton of AuthService
      register { AuthService() }.scope(.application)
    
  }
    
}
