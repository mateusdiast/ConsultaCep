//
//  AddressStore.swift
//  ConsultaCep
//
//  Created by mateusdias on 05/10/23.
//

import Alamofire
import Foundation



class AddressStore{
    
    private let baseURL = API.baseURL
    
    var addressData: AddressModel?
    
    func fetchDataFromAPI(cep: String, callback: @escaping (Result<AddressModel, ServiceErrorModel>) -> Void) {
        let path = "/\(cep)/json"
        
        guard let url = URL(string: baseURL + path) else {
            callback(.failure(.invalidURL))
            return
        }
        
        let request = AF.request(url).response { (responseData) in
            guard let data = responseData.data else {
                callback(.failure(.network))
                return
            }
            do {
                self.addressData = try JSONDecoder().decode(AddressModel.self, from: data)
                callback(.success(self.addressData!))
            } catch {
                callback(.failure(.decodeFail))
            }
        }
            
        }
    
    func getZipcodeData() -> String {
        guard let addressData = self.addressData else {
            return  "Sem dados para o cep"
        }
        return addressData.zipcode
        
    }
    
    func getAddressData() -> String {
        guard let addressData = self.addressData else {
            return "Sem dados para o logradouro"
        }
        return addressData.address
    }
    
    func getCityData() -> String {
        guard let addressData = self.addressData else {
            return "Sem dados para a cidade"
        }
        return addressData.city
    }
    
    func getUfData() -> String {
        guard let addressData = self.addressData else {
            return "Sem dados para o estado"
        }
        return addressData.uf
    }
}



