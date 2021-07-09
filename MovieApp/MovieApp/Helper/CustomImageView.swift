//
//  CustomImageView.swift
//  MovieApp
//
//  Created by Alexandre Cardoso on 06/07/21.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

class CustomImageView: UIImageView {
	var task: URLSessionTask!
	let spinner = UIActivityIndicatorView(style: .medium)
	
	func loadImage(from url: URL) {
		image = nil
		addSpinner()
		
		if let task = task {
			task.cancel()
		}
		
		if let imageFromCache = imageCache.object(forKey: url.absoluteString as AnyObject) as? UIImage {
			self.image = imageFromCache
			removeSpinner()
			return
		}
		
		task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
			guard let data = data, let newImage = UIImage(data: data) else { return }
			imageCache.setObject(newImage, forKey: url.absoluteString as AnyObject)
			
			DispatchQueue.main.async {
				self.image = newImage
				self.removeSpinner()
			}
		})
		
		task.resume()
	}
	
	func addSpinner() {
		addSubview(spinner)
		
		spinner.translatesAutoresizingMaskIntoConstraints = false
		spinner.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
		spinner.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		
		spinner.startAnimating()
	}
	
	func removeSpinner() {
		spinner.removeFromSuperview()
	}
	
}
