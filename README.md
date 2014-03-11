DSMultilineLabelNode
====================

SKLabelNode replacement to support multiline functionality, now compatible with both Mac OS X and iOS builds of SpriteKit games.

This should be a direct drop-in replacement for SKLabelNode, even though it's implemented by subclassing SKSpriteNode.  We support all the properties and methods of SKLabelNode.

There is an exception as SKLabelNode appears to be more forgiving to having EXACT font names.

The main difference to using an SKLabelNode is that you now may specify the property

	paragraphWidth
	
This is a value in pixels as to how wide you want your label node to expand before creating newlines. See the demo for example usage.

Relevant files are DSMultilineLabelNode.h and DSMultilineLabelNode.m
 
Copyright (C) 2014 Downright Simple

----

This software is licensed under an MIT-style license.  

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
