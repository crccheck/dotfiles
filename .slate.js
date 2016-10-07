/* global slate */
// Use the "console" and search for "Slate" to view logs
// move / resize / push / nudge / throw ...
// https://github.com/jigish/slate/wiki/Operations
(function (S) {
  'use strict';

  // A global counter
  var counter = 0

  // Configs
  S.configAll({
    'defaultToCurrentScreen': true
    // 'secondsBetweenRepeat' : 0.1,
    // 'checkDefaultsOnLoad' : true,
    // 'focusCheckWidthMax' : 3000,
    // 'orderScreensLeftToRight' : true
  })

  function isUltraWide () {
    // https://github.com/jigish/slate/wiki/Screen-Object
    var screenWidth = S.screen().rect().width
    return screenWidth > 3000
  }

  function getWidthOptions () {
    if (isUltraWide()) {
      return ['screenSizeX/3']
    }

    return [
      'screenSizeX/2',
      'screenSizeX*9/20',
      'screenSizeX*11/20'
    ]
  }

  function dynPushWidth () {
    var options = getWidthOptions()
    var ret = 'bar-resize:' + options[counter % options.length]
    counter++
    return ret
  }

  // Reset the counter every time we change focus
  S.on('appActivated', function () {
    counter = 0
  })

  // Operations
  var baseMove = S.operation('move', {
    x: 'screenOriginX',
    y: 'screenOriginY',
    width: 'screenSizeX',
    height: 'screenSizeY'
  });
  var move = {
    full: baseMove,
    middle: function (win) {
      if (isUltraWide()) {
        win.doOperation(baseMove.dup({x: 'screenOriginX+screenSizeX*1/3', width: 'screenSizeX/3'}))
      } else {
        win.doOperation(baseMove)
      }
    },
    left: S.operation('push', {direction: 'left', style: dynPushWidth}),
    right: S.operation('push', {direction: 'right', style: dynPushWidth}),
    top: S.operation('resize', {height: '-25%'}),
    bottom: S.operation('resize', {height: '-25%', anchor: 'bottom-left'}),
    topLeft: S.operation('corner', {direction: 'top-left', width: 'screenSizeX/2', height: 'screenSizeY/2'}),
    topRight: S.operation('corner', {direction: 'top-right', width: 'screenSizeX/2', height: 'screenSizeY/2'}),
    bottomLeft: S.operation('corner', {direction: 'bottom-left', width: 'screenSizeX/2', height: 'screenSizeY/2'}),
    bottomRight: S.operation('corner', {direction: 'bottom-right', width: 'screenSizeX/2', height: 'screenSizeY/2'})
  };

  // Almost-maximize the focused window
  var mainify = S.operation('chain', {
    operations: [
      S.operation('push', {
        direction: 'left',
        style: 'bar-resize:screenSizeX*7/10'
      }),
      S.operation('push', {
        direction: 'right',
        style: 'bar-resize:screenSizeX*7/10'
      }),
      move.full
    ]
  });

  // Batch bind everything. Less typing.
  S.bindAll({
    // Basic Location Bindings
    'pad1:ctrl;cmd': move.bottomLeft,
    'pad2:ctrl;cmd': move.bottom,
    'down:ctrl;cmd': move.bottom,
    'pad3:ctrl;cmd': move.bottomRight,
    'pad4:ctrl;cmd': move.left,
    'left:ctrl;cmd': move.left,
    'pad5:ctrl;cmd': move.middle,
    'pad6:ctrl;cmd': move.right,
    'right:ctrl;cmd': move.right,
    'pad7:ctrl;cmd': move.topLeft,
    'pad8:ctrl;cmd': move.top,
    'up:ctrl;cmd': move.top,
    'pad9:ctrl;cmd': move.topRight,
    'pad4:ctrl;alt': S.operation('throw', {screen: 'left'}),
    'left:ctrl;alt': S.operation('throw', {screen: 'left'}),
    'pad6:ctrl;alt': S.operation('throw', {screen: 'right'}),
    'right:ctrl;alt': S.operation('throw', {screen: 'right'}),
    'pad+:ctrl;cmd': mainify,
    '=:ctrl;cmd': mainify
  });

  // Log that we're done configuring
  S.log('[SLATE] -------------- Finished Loading Config --------------');
})(slate);
