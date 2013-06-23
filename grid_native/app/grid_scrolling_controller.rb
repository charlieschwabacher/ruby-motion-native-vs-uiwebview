class GridScrollingController < UIViewController

  def loadView
    self.view = UIScrollView.alloc.initWithFrame UIScreen.mainScreen.applicationFrame
  end

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.whiteColor

    @margin = 15
    @columns = 3
    @tile_count = 100
    @width = self.view.size.width
    @tile_width = (@width - (@columns + 1) * @margin) / @columns
    @tile_height = @tile_width * 1.5
    @height = (@tile_height + @margin) * (1.0 * @tile_count / @columns).ceil + @margin    
    @colors = ['#ff695a', '#f9a77c', '#579092', '#3695d8', '#d998a6', 
               '#dc4537', '#fff280', '#94c59c', '#3b5065', '#b75468'].map(&:to_color)

    self.view.setContentSize CGSizeMake(@width, @height)

    @tile_views = @tile_count.times.map do |i|
      left = @margin + (i % @columns) * (@tile_width + @margin)
      top = @margin + (i / @columns).floor * (@tile_height + @margin)
      tile_view = UIView.alloc.initWithFrame CGRectMake(left, top, @tile_width, @tile_height)
      tile_view.backgroundColor = @colors.sample
      self.view.addSubview tile_view
      tile_view
    end
  end
end