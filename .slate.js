/* global slate */
(function (S) {
  'use strict';

  // A global counter
  var counter = 0

  // move / resize / push / nudge / throw ...
  // https://github.com/jigish/slate/wiki/Operations

  // Configs
  S.configAll({
    'defaultToCurrentScreen': true
    // 'secondsBetweenRepeat' : 0.1,
    // 'checkDefaultsOnLoad' : true,
    // 'focusCheckWidthMax' : 3000,
    // 'orderScreensLeftToRight' : true
  });

  // Magic to toggle between several widths
  function dynWidth () {
    var options = [
      'screenSizeX/2',
      'screenSizeX*11/20',
      'screenSizeX*9/20'
    ]
    var ret = options[counter % options.length]
    counter++
    return ret
  }
  // The appropriate X that corresponds with the dynWidth
  function dynX (){
    var options = [
      'screenOriginX+screenSizeX/2',
      'screenOriginX+screenSizeX*9/20',
      'screenOriginX+screenSizeX*11/20'
    ]
    return options[counter % options.length]
  }

  // Magic to toggle between several heights
  function dynHeight () {
    var options = [
      'screenSizeY/2',
      'screenSizeY*13/20',
      'screenSizeY*7/20'
    ]
    var ret = options[counter % options.length]
    counter++
    return ret
  }
  // The appropriate Y that corresponds with the dynHeight
  function dynY () {
    var options = [
      'screenOriginY+screenSizeY/2',
      'screenOriginY+screenSizeY*7/20',
      'screenOriginY+screenSizeY*13/20'
    ]
    return options[counter % options.length]
  }

  // Reset the counter every time we change focus
  S.on('appActivated', function () {
    counter = 0;
  });

  // Operations
  var baseMove = S.operation('move', {
        x: 'screenOriginX',
        y: 'screenOriginY',
        width: 'screenSizeX',
        height: 'screenSizeY'
      });
  var positions = {
        left: 'screenOriginX',
        top: 'screenOriginY',
        right: 'screenSizeX',
        bottom: 'screenSizeY',
        center: 'screenOriginX+screenSizeX/2',  // X
        middle: 'screenOriginY+screenSizeY/2'  // Y
      },
      move = {
        full: baseMove,
        left: baseMove.dup({width: dynWidth}),
        right: baseMove.dup({x: dynX, width: dynWidth}),
        top: baseMove.dup({height: dynHeight}),
        bottom: baseMove.dup({y: dynY, height: dynHeight}),
        topLeft: baseMove.dup({width: 'screenSizeX/2', height: 'screenSizeY/2'}),
        topRight: baseMove.dup({x: positions.center, width: 'screenSizeX/2', height: 'screenSizeY/2'}),
        bottomLeft: baseMove.dup({y: positions.middle, width: 'screenSizeX/2', height: 'screenSizeY/2'}),
        bottomRight: baseMove.dup({x: positions.center,
                                   y: positions.middle,
                                   width: 'screenSizeX/2',
                                   height: 'screenSizeY/2'})
      };

  // Batch bind everything. Less typing.
  S.bindAll({
    // Basic Location Bindings
    'pad1:ctrl;cmd': move.bottomLeft,
    'pad2:ctrl;cmd': move.bottom,
    'down:ctrl;cmd': move.bottom,
    'pad3:ctrl;cmd': move.bottomRight,
    'pad4:ctrl;cmd': move.left,
    'left:ctrl;cmd': move.left,
    'pad5:ctrl;cmd': move.full,
    'pad6:ctrl;cmd': move.right,
    'right:ctrl;cmd': move.right,
    'pad7:ctrl;cmd': move.topLeft,
    'pad8:ctrl;cmd': move.top,
    'up:ctrl;cmd': move.top,
    'pad9:ctrl;cmd': move.topRight,
    'pad4:ctrl;alt': S.operation('throw', {screen: 'left'}),
    'left:ctrl;alt': S.operation('throw', {screen: 'left'}),
    'pad6:ctrl;alt': S.operation('throw', {screen: 'right'}),
    'right:ctrl;alt': S.operation('throw', {screen: 'right'})
  });

  // Almost-maximize the focused window
  function mainify(win) {
    switch (counter % 3){
      case 0:
        win.doOperation(S.operation('move', {
          x: 'screenOriginX',
          y: 'screenOriginY',
          width: 'screenSizeX*7/10',
          height: 'screenSizeY'
        }));
      break;
      case 1:
        win.doOperation(S.operation('move', {
          x: 'screenOriginX+screenSizeX*3/10',
          y: 'screenOriginY',
          width: 'screenSizeX*7/10',
          height: 'screenSizeY'
        }));
      break;
      case 2:
        win.doOperation(move.full);
      break;
    }
    counter++;
  }
  S.bind('pad+:ctrl;cmd', mainify);
  S.bind('=:ctrl;cmd', mainify);

  // Log that we're done configuring
  S.log('[SLATE] -------------- Finished Loading Config --------------');
})(slate);
