class CardSwipingController < UIViewController

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.whiteColor

    @margin = 30
    @width = self.view.size.width - 2 * @margin
    @height = self.view.size.height - 2 * @margin
    @animation_speed = 0.3
    @colors = ['#ff695a', '#f9a77c', '#579092', '#3695d8', '#d998a6', 
               '#dc4537', '#fff280', '#94c59c', '#3b5065', '#b75468']
    
    @card_views = @colors.shuffle.map do |hex|
      card_view = UIView.alloc.initWithFrame CGRectMake(@margin, @margin, @width, @height)
      card_view.backgroundColor = hex.to_color
      card_view.layer.transform = stacked_transform
      self.view.addSubview card_view
      card_view
    end

    # set up swipe handlers
    @animating = false
    self.view.when_swiped{ animate_card_out unless @animating }.direction = UISwipeGestureRecognizerDirectionLeft
    self.view.when_swiped{ animate_card_in unless @animating }.direction = UISwipeGestureRecognizerDirectionRight

  end

  def active_card
    @card_views.last
  end

  def stacked_transform
    CATransform3D.identity
  end

  def removed_transform
    direction = rand() - 0.5
    (
      CATransform3D.perspective(0.0003, 0) + 
      CATransform3D.translate(-self.view.frame.width * 1.3, -direction * self.view.frame.height / 50, 0) +
      CATransform3D.rotate(direction * Math::PI / 8)
    )
  end

  def animate_card_out
    
    @animating = true

    # move view from top to bottom of the @card_views array
    card_view = @card_views.pop
    @card_views.unshift card_view

    UIView.animateWithDuration(@animation_speed,
      
      # animate card forward and to the left with fade out and random rotation
      animations: lambda {
        card_view.layer.transform += removed_transform
        card_view.alpha = 0.5
      },

      #restore cards transform, update z index    
      completion: lambda {|result|
        @animating = false
        card_view.layer.transform = stacked_transform
        card_view.alpha = 1.0
        self.view.sendSubviewToBack card_view
      }
    )

  end

  def animate_card_in

    @animating = true

    # move view from bottom to top of the @card_views array
    card_view = @card_views.shift
    @card_views.push card_view

    # pre-apply transform and update z index of card views
    self.view.bringSubviewToFront card_view
    card_view.layer.transform += removed_transform
    card_view.alpha = 0.5

    UIView.animateWithDuration(@animation_speed,
      
      #animate card down and to the left with fade in and random rotation
      animations: lambda { 
        card_view.layer.transform = stacked_transform
        card_view.alpha = 1
      },
      
      completion: lambda {|result|
        @animating = false
      }
    )

  end

end
