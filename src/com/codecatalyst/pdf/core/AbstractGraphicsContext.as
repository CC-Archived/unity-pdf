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
	
	public class AbstractGraphicsContext implements IGraphicsContext
	{
		// ========================================
		// Public Properties
		// ========================================
		
		/**
		 * Backing variable for the <code>bounds</code> property.
		 */
		protected var _bounds:Rectangle;
		
		/**
		 * Backing variable for the <code>dpi</code> property.
		 */
		protected var _dpi:Number;
		
		// ========================================
		// Public Properties
		// ========================================
		
		/**
		 * @inheritDoc
		 */
		public function get bounds():Rectangle
		{
			return _bounds;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get dpi():Number
		{
			return _dpi;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get imageEncoder():IImageEncoder
		{
			throw new Error( "Subclasses must implement this method." );
		}
		
		// ========================================
		// Constructor.
		// ========================================
		
		/**
		 * Constructor.
		 */
		public function AbstractGraphicsContext( dpi:Number, bounds:Rectangle )
		{
			super();
			
			_dpi = dpi;
			_bounds = bounds;
		}
		
		// ========================================
		// Public Methods
		// ========================================
		
		/**
		 * @inheritDoc
		 */
		public function drawImageAtPoint( imageBytes:ByteArray, point:Point, width:Number, height:Number ):void
		{
			throw new Error( "Subclasses must implement this method." );
		}
		
		/**
		 * @inheritDoc
		 */
		public function setFont( fontName:String, size:Number ):void
		{
			throw new Error( "Subclasses must implement this method." );
		}
		
		/**
		 * @inheritDoc
		 */
		public function setTextColor( color:uint ):void
		{
			throw new Error( "Subclasses must implement this method." );
		}
		
		/**
		 * @inheritDoc
		 */
		public function writeTextAtPoint( text:String, point:Point ):void
		{
			throw new Error( "Subclasses must implement this method." );
		}
		
		/**
		 * @inheritDoc
		 */
		public function writeTextInsideRectangle( text:String, rectangle:Rectangle, alignment:TextAlignment ):void
		{
			throw new Error( "Subclasses must implement this method." );
		}
	}
}