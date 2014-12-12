# BlockCursorEverywhere #

![Screenshot](http://f.cl.ly/items/42131K2X1h0j0P2m1O2B/Screen%20Shot%202011-12-02%20at%202.36.54%20AM.png)

It can become very difficult to keep track of your cursor location, especially with the [Vintage](http://www.sublimetext.com/docs/3/vintage.html) or [Vintageous](https://github.com/guillermooo/Vintageous) plugins. This is solved by having a "block" cursor, which is very easy to spot no matter where it is on screen. Unfortunately, Sublime Text 2 and 3 do not (yet) support this feature natively. This Plugin mimics this functionality by highlighting the area behind the cursor whenever it moves (similar to how you might highlight syntax errors, or color a comment).

## Installation ##

### With Package Control ###

If you have the [Package Control][package_control] installed, you can install BlockCursorEverywhere from inside Sublime Text itself. Open the Command Palette and select "Package Control: Install Package", then search for BlockCursorEverywhere and you’re done!

### Without Package Control ###

Go to your Sublime Text Packages directory:

	Windows: %USERPROFILE%\AppData\Roaming\Sublime Text 3\Packages\
	Mac: ~/Library/Application Support/Sublime Text 3/Packages/

and clone the repository there.

## Configuration ##

These are the settings that I prefer. You can change the style of the block cursor by adding a section to your theme file like so:

```xml
<dict>
	<key>name</key>
	<string>Block Cursor</string>
	<key>scope</key>
	<string>block_cursor</string>
	<key>settings</key>
	<dict>
		<key>foreground</key>
		<string>#000000</string>
		<key>background</key>
		<string>#FF1111</string>
	</dict>
</dict>
```

---------

[sublime]: http://www.sublimetext.com/3
[package_control]: http://wbond.net/sublime_packages/package_control
