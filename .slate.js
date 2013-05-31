(function(S){
  "use strict";

  // Configs
  S.configAll({
    "defaultToCurrentScreen" : true
    // "secondsBetweenRepeat" : 0.1,
    // "checkDefaultsOnLoad" : true,
    // "focusCheckWidthMax" : 3000,
    // "orderScreensLeftToRight" : true
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
        left: baseMove.dup({width: "screenSizeX/2"}),
        right: baseMove.dup({x: positions.center, width: "screenSizeX/2"}),
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
    "pad9:ctrl;cmd": move.topRight
  });

  // Log that we're done configuring
  S.log("[SLATE] -------------- Finished Loading Config --------------");
})(slate);
