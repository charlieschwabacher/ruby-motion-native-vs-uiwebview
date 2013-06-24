Ruby Motion native vs HTML Comparison
==========================================

This includes html and native versions of two simple apps in ruby motion - written for me to compare the 
code required and performance cost of doing some simple things natively in ruby motion vs in javascript
included in a UIWebView.

The first app swipes cards on and off a stack with a 3d transform.  
Compare `/cards_html/resources/cards.coffee` to `/cards_native/app/card_swiping_controller.rb`.

The second app scrolls through a long grid of content.  
Compare `/grid_html/resources/grid.coffee` to `/grid_native/app/grid_scrolling_controller.rb`.

To run one of the apps, with ruby motion installed, `rake` from its root directory
