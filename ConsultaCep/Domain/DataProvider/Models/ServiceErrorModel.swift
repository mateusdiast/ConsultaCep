//
//  ServiceErrorModel.swift
//  ConsultaCep
//
//  Created by mateusdias on 06/10/23.
//

import Foundation

enum ServiceErrorModel: Error {
    case invalidURL
    case decodeFail
    case network
}

