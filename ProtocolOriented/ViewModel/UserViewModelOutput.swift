//
//  UserViewModelOutput.swift
//  ProtocolOriented
//
//  Created by Emir Türk on 16.04.2023.
//

import Foundation


protocol UserViewModelOutput : AnyObject {
    func updateView(name: String, email: String, userName: String)
}
