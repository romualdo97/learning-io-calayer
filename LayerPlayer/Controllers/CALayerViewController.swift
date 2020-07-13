/// Copyright (c) 2020 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

class CALayerViewController: UIViewController {
  @IBOutlet weak var viewForLayer: UIView!

  let layer = CALayer()
  let layer2 = CALayer();

  // MARK: - View life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpLayer()
    
    // viewForLayer.layer.shouldRasterize = true
    // viewForLayer.layer.masksToBounds = true // default is false
    viewForLayer.layer.addSublayer(layer2)
    viewForLayer.layer.addSublayer(layer)
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "DisplayLayerControls" {
      (segue.destination as? CALayerControlsViewController)?.layerViewController = self;
    }
  }
}

// MARK: - Layer
extension CALayerViewController {
  func setUpLayer() {
    // 1
    // layer.frame = viewForLayer.bounds
    layer.frame = CGRect(x: 0, y: 0, width: viewForLayer.bounds.width, height: 190)
    layer.contents = UIImage(named: "star")?.cgImage
    
    // 2
    layer.contentsGravity = .center
    layer.magnificationFilter = .linear
    
    // 3
    layer.cornerRadius = 190/2
    layer.borderWidth = 12.0
    layer.borderColor = UIColor.white.cgColor
    layer.backgroundColor = swiftOrangeColor.cgColor
    
    // 4
    layer.shadowOpacity = 0.6
    layer.shadowOffset = CGSize(width: 3, height: 3)
    layer.shadowRadius = 9
    layer.isGeometryFlipped = true
    
    layer2.frame = CGRect(x: viewForLayer.bounds.maxX, y: 0, width: 80, height: viewForLayer.bounds.height - 50)
    layer2.backgroundColor = UIColor.green.cgColor
    }
}
