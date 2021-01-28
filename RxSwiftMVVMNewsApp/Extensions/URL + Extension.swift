//
//  URL + Extension.swift
//  RxSwiftMVVMNewsApp
//
//  Created by Evgeniy Uskov on 18.12.2020.
//

import Foundation

extension URL {
    static func urlForNewsAPI() -> URL? {
            return URL(string: Constants.url + Constants.apiKey)
    }
}
