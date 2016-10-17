//
//  ViewController.swift
//  ImageFreeCut
//
//  Created by Cem Olcay on 17/10/16.
//  Copyright © 2016 Mojilala. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
  @IBOutlet weak var imageView: UIImageView?
  var resultImage: UIImage?

  override func viewDidLoad() {
    super.viewDidLoad()
    imageView?.image = resultImage
  }
}

class ViewController: UIViewController, ImageFreeCutViewDelegate {
  @IBOutlet weak var freeCutView: ImageFreeCutView?

  // MARK: Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    downloadTestCutImage()

    freeCutView?.delegate = self
    freeCutView?.imageCutShapeLayer.strokeColor = UIColor.green.cgColor
    freeCutView?.imageCutShapeLayer.lineWidth = 3
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let result = segue.destination as? ResultViewController,
      let image = sender as? UIImage,
      segue.identifier == "result" {
      result.resultImage = image
    }
  }

  // MARK: Demo Image
  private func downloadTestCutImage() {
    guard let url = URL(string: "http://static1.comicvine.com/uploads/scale_small/11/113509/4693444-6164752601-ben_a.jpg") else { return }

    let task = URLSession.shared.dataTask(
      with: url,
      completionHandler: { [weak self] data, _, _ in
        guard let data = data, let image = UIImage(data: data) else { return }
        self?.freeCutView?.imageToCut = image
      })
    task.resume()
  }

  // MARK: ImageFreeCutViewDelegate
  func imageFreeCutView(_ imageFreeCutView: ImageFreeCutView, didCut image: UIImage?) {
    performSegue(withIdentifier: "result", sender: image)
  }
}
