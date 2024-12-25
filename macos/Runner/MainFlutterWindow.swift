import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
<<<<<<< HEAD
    let flutterViewController = FlutterViewController()
=======
    let flutterViewController = FlutterViewController.init()
>>>>>>> 82c7206f25a9a1fc028e57327db131e7eca85cd1
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}
