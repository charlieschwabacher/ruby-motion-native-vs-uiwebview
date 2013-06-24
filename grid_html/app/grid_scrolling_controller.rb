class GridScrollingController < UIViewController

  def loadView
    self.view = UIScrollView.alloc.initWithFrame UIScreen.mainScreen.applicationFrame
    
    web_frame = UIScreen.mainScreen.applicationFrame
    web_frame.origin.y = 0.0
    
    @web_view = UIWebView.alloc.initWithFrame(web_frame)
    @web_view.scrollView.decelerationRate = UIScrollViewDecelerationRateNormal
    @web_view.delegate = self

    url = NSURL.fileURLWithPath(NSBundle.mainBundle.pathForResource('grid', ofType:'html'))
    @web_view.loadRequest(NSURLRequest.requestWithURL(url))
  end

  def viewDidLoad
    super

    self.view.addSubview @web_view
  end
end