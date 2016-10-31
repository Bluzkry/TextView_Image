import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    let imageView = UIImageView(image: UIImage(named: "Image"))

    override func viewDidLoad() {
        super.viewDidLoad()
        //If we add the image as a subview of the text view we can sorta treat
        // them as one unit, so currently our text view has autolayout set up
        // on it in the storyboard, so it will stretch to be the same size as
        // the phone it is running on
        textView.addSubview(imageView)
    }

    // Now that the view controller has finished laying out our textView,
    // we can focus on getting our image setup correctly.
    override func viewDidLayoutSubviews() {
        // Get the dimensions of the image, (intrinsic content size will also
        // work for text and other things too if you want to know how much room
        // a thing will take up at layout time
        let imageSize = imageView.intrinsicContentSize
        // Now that the image is a subview, of the textview, it's there but has
        // not been laid out yet and does not have a size, Here we will tell it
        // how big to be and where to be positioned.
        // To start we can put it in the top corner of the text view, taking up
        // our previously calculated size.
        //        imageView.frame = CGRect(origin: textView.frame.origin, size: imageSize)



        //--- Found this blob of text on Stack overflow, 
        // I wanted to figure out how we can know, like what frame, where some 
        // heading or something might be layed out at, so we can put our image next to it. 
        //http://stackoverflow.com/questions/28468187/find-cgpoint-location-of-substring-in-textview#28469139
        //
        // or we can figure out where the title we want is in the text
        //
        // range of substring to search
        let str1 = textView.attributedText.string as NSString
        let range = str1.range(of: "Some Title For", options: [], range: NSMakeRange(0, str1.length))

        // you should ensure layout
        textView.layoutManager.ensureLayout(for: textView.textContainer)

        // text position of the range.location
        let start = textView.position(from: textView.beginningOfDocument, offset: range.location)!
        // text position of the end of the range
        let end = textView.position(from: start, offset: range.length)!
        // text range of the range
        let tRange = textView.textRange(from: start, to: end)
        // here it is!
        let rect = textView.firstRect(for: tRange!)
        //----

        imageView.frame = CGRect(origin: rect.origin, size: imageSize)

        //now that it has a size and has been laid out, we can get the path, and
        // set the exclusionPaths
        let imagePath = UIBezierPath(rect:imageView.frame)
        textView.textContainer.exclusionPaths = [imagePath]

        // Now that the frame of the image has moved we need the textView to
        // re-lay itself out since the image have been inclued and the exclusion
        // path has changed.
        textView.setNeedsLayout()
    }
}
