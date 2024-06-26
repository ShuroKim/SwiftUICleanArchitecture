//
//  ImagesInteractor.swift
//  SwiftUICleanArchitecture
//
//  Created by Shuraw on 3/28/24.
//

import Combine
import Foundation
import SwiftUI

protocol ImagesInteractor {
    func load(image: LoadableSubject<UIImage>, url: URL?)
}

struct RealImagesInteractor: ImagesInteractor {
    
    let webRepository: ImageWebRepository
    
    init(webRepository: ImageWebRepository) {
        self.webRepository = webRepository
    }
    
    func load(image: LoadableSubject<UIImage>, url: URL?) {
        guard let url = url else {
            image.wrappedValue = .notRequested; return
        }
        let cancelBag = CancelBag()
        image.wrappedValue.setIsLoading(cancelBag: cancelBag)
        webRepository.load(imageURL: url)
            .sinkToLoadable {
                image.wrappedValue = $0
            }
            .store(in: cancelBag)
    }
}

struct StubImagesInteractor: ImagesInteractor {
    func load(image: LoadableSubject<UIImage>, url: URL?) {
    }
}
