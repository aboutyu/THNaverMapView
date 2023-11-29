//
//  File.swift
//  
//
//  Created by 유태훈 on 11/28/23.
//

import Foundation

public protocol THNMapViewDelegate {
    func thNMapViewErrorState(_ error: Error)
    func thNMapViewDidTap(_ data: THNMapDto)
}
