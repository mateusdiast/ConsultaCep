//
//  AddressModel.swift
//  ConsultaCep
//
//  Created by mateusdias on 05/10/23.
//

import Foundation

struct AddressModel: Decodable {
    let zipcode: String
    let address: String
    let city: String
    let uf: String
    
    enum CodingKeys: String, CodingKey{
        case zipcode = "cep"
        case address = "logradouro"
        case city = "localidade"
        case uf
    }
    
}
