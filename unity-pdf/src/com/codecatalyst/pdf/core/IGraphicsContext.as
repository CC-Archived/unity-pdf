/*
* Copyright 2010 CodeCatalyst, LLC - http://www.codecatalyst.com/
* 
* Licensed under the Apache License, Version 2.0 (the "License"); you may not
* use this file except in compliance with the License. You may obtain a copy of
* the License. You may obtain a copy of the License at
* 
* http://www.apache.org/licenses/LICENSE-2.0
* 
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
* WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
* License for the specific language governing permissions and limitations under
* the License.
*/

package com.codecatalyst.pdf.core
{
	import com.codecatalyst.pdf.enum.TextAlignment;
	
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	
	import mx.graphics.codec.IImageEncoder;

	public interface IGraphicsContext
	{
		// ========================================
		// Properties
		// ========================================
		
		/**
		 * Bounding Rectangle.
		 */
		function get bounds():Rectangle;
		
		/**
		 * Dots Per Inch.
		 */
		function get dpi():Number;
		
		/**
		 * Image encoder.
		 */
		function get imageEncoder():IImageEncoder;
		
		// ========================================
		// Properties
		// ========================================
		
		// TODO: Refine and expand available methods to conform to typical graphics context capabilities.

		/**
		 * Draw the specified image at the specified Point with the specified width and height.
		 */
		function drawImageAtPoint( image:ByteArray, point:Point, width:Number, height:Number ):void;	
		
		/**
		 * Set the current font and font size.
		 */
		function setFont( fontName:String, size:Number ):void;
		
		/**
		 * Set the current text color.
		 */
		function setTextColor( color:uint ):void;
		
		/**
		 * Write text at the specified Point.
		 */
		function writeTextAtPoint( text:String, point:Point ):void;
		
		/**
		 * Write text inside the specified Rectangle with the specified text alignment.
		 */
		function writeTextInsideRectangle( text:String, rectangle:Rectangle, alignment:TextAlignment ):void;
	}
}