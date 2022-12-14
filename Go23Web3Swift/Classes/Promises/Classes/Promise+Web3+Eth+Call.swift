//
//  Promise+Web3+Eth+Call.swift
//  web3swift-iOS
//
//  Created by Alexander Vlasov on 18.06.2018.
//  Copyright © 2018 Bankex Foundation. All rights reserved.
//

import Foundation
import PromiseKit

extension web3.Eth {
    
    func callPromise(_ transaction: EthereumTransaction, options: Web3Options, onBlock: String = "latest") -> Promise<Data>{
        let queue = web3.requestDispatcher.queue
        do {
            guard let request = EthereumTransaction.createRequest(method: .call, transaction: transaction, onBlock: onBlock, options: options) else {
                throw Web3Error.processingError("Transaction is invalid")
            }
            let rp = web3.dispatch(request)
            return rp.then(on: queue ) { response -> Promise<Data> in
                guard let value: Data = response.getValue() else {
                    if response.error != nil {
                        if let ccipRead = CcipRead(web3: self.web3, options: self.options, onBlock: onBlock, fromDataString: response.error?.data) {
                            return ccipRead.process()
                        }
                        throw Web3Error.nodeError(response.error!.message)
                    }
                    throw Web3Error.nodeError("Invalid value from Ethereum node")
                }
                return Promise.value(value)
            }
        } catch {
            let returnPromise = Promise<Data>.pending()
            queue.async {
                returnPromise.resolver.reject(error)
            }
            return returnPromise.promise
        }
    }
}
