(function(S){
  "use strict";

  // move / resize / push / nudge / throw ...
  // https://github.com/jigish/slate/wiki/Operations

  // Configs
  S.configAll({
    "defaultToCurrentScreen" : true
    // "secondsBetweenRepeat" : 0.1,
    // "checkDefaultsOnLoad" : true,
    // "focusCheckWidthMax" : 3000,
    // "orderScreensLeftToRight" : true
  });

  // magic to toggle between several widths
  var counter = 0;
  var dynWidth = function(){
    var widths = ["screenSizeX/2", "screenSizeX*11/20", "screenSizeX*9/20"];
    var width = widths[counter];
    counter = (counter + 1) % widths.length;
    return width;
  };
  // the appropriate X that corresponds with the dynamic width
  var dynX = function(){
    return [
      'screenOriginX+screenSizeX/2',
      'screenOriginX+screenSizeX*9/20',
      'screenOriginX+screenSizeX*11/20'
    ][counter];
  };
  // reset the counter every time we change focus
  S.on('appActivated', function(){
    counter = 0;
  });

  // Operations
  var baseMove = S.operation("move", {
        x: "screenOriginX",
        y: "screenOriginY",
        width: "screenSizeX",
        height: "screenSizeY"
      });
  var positions = {
        left: "screenOriginX",
        top: "screenOriginY",
        right: "screenSizeX",
        bottom: "screenSizeY",
        center: "screenOriginX+screenSizeX/2",  // X
        middle: "screenOriginY+screenSizeY/2"  // Y
      },
      move = {
        full: baseMove,
        left: baseMove.dup({width: dynWidth}),
        right: baseMove.dup({x: dynX, width: dynWidth}),
        top: baseMove.dup({height: "screenSizeY/2"}),
        bottom: baseMove.dup({y: positions.middle, height: "screenSizeY/2"}),
        topLeft: baseMove.dup({width: "screenSizeX/2", height: "screenSizeY/2"}),
        topRight: baseMove.dup({x: positions.center, width: "screenSizeX/2", height: "screenSizeY/2"}),
        bottomLeft: baseMove.dup({y: positions.middle, width: "screenSizeX/2", height: "screenSizeY/2"}),
        bottomRight: baseMove.dup({x: positions.center, y: positions.middle, width: "screenSizeX/2", height: "screenSizeY/2"})
      };

  // Batch bind everything. Less typing.
  S.bindAll({
    // Basic Location Bindings
    "pad1:ctrl;cmd": move.bottomLeft,
    "pad2:ctrl;cmd": move.bottom,
    "pad3:ctrl;cmd": move.bottomRight,
    "pad4:ctrl;cmd": move.left,
    "pad5:ctrl;cmd": move.full,
    "pad6:ctrl;cmd": move.right,
    "pad7:ctrl;cmd": move.topLeft,
    "pad8:ctrl;cmd": move.top,
    "pad9:ctrl;cmd": move.topRight,
    'pad4:ctrl;alt': S.operation('throw', {screen: 'left'}),
    'pad6:ctrl;alt': S.operation('throw', {screen: 'right'})
  });

  // App specific logic
  // Sublime Text
  // should this be a layout?
  S.bind('pad+:ctrl;cmd', function(win){
    var appName = win.app().name();
    if (appName === "Sublime Text 2"){
      win.doOperation(S.operation("move", {
        x: "screenOriginX+screenSizeX*3/10",
        y: "screenOriginY",
        width: "screenSizeX*7/10",
        height: "screenSizeY"
      }));
    } else {
      S.log(appName);
    }
  });


  // Log that we're done configuring
  S.log("[SLATE] -------------- Finished Loading Config --------------");
})(slate);
