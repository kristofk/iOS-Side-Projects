//
//  PendingOperations.swift
//  iTunesClient
//
//  Created by Kristof Kocsis on 2018. 03. 02..
//  Copyright © 2018. Treehouse Island. All rights reserved.
//

import Foundation

class PendingOperations {
	var downloadsInProgress = [IndexPath: Operation]()
	
	let downloadQueue = OperationQueue()
}
