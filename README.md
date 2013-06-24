Ruby Motion native vs UIWebView Comparison
==========================================

This includes html and native versions of two simple apps in ruby motion.  I wrote these to compare the code and performance of some simple things that may tax a UIWebView.

The first app is a stack of cards where the top can be swiped on and off with a 3d transform.  The relevant files are /cards_html/resources/cards.coffee and /cards_native/app/card_swiping_controller.rb.

The second app is a long scrolling grid of content.  The relevant files are /grid_html/resources/grid.coffee and /grid_native/app/grid_scrolling_controller.rb.

To run the apps, with ruby motion installed, run `rake` from their root directory
