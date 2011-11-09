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
	import com.codecatalyst.pdf.IPdfGenerator;
	import com.codecatalyst.pdf.enum.PageOrientation;
	import com.codecatalyst.pdf.enum.PageSize;
	import com.codecatalyst.pdf.renderers.IDisplayObjectRenderer;
	
	import flash.display.DisplayObject;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	public class AbstractPage implements IPage
	{
		// ========================================
		// Protected Properties
		// ========================================
		
		/**
		 * Backing variable for <code>bounds</code> property.
		 */
		protected var _bounds:Rectangle;
		
		/**
		 * Backing variable for the <code>context</code> property.
		 */
		protected var _context:IGraphicsContext;
		
		/**
		 * Backing variable for <code>generator</code> property.
		 */
		protected var _generator:IPdfGenerator;
		
		/**
		 * Backing variable for the <code>orientation</code> property.
		 */
		protected var _orientation:PageOrientation;
		
		/**
		 * Backing variable for the <code>parentDocument</code> property.
		 */
		protected var _parentDocument:IDocument;
		
		/**
		 * Backing variable for the <code>size</code> property.
		 */
		protected var _size:PageSize;
		
		// ========================================
		// Public Properties
		// ========================================
		
		public function get bounds():Rectangle
		{
			_bounds ||= calculateBounds();
			
			return _bounds;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get context():IGraphicsContext
		{
			_context ||= createGraphicsContext();
			
			return _context;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get generator():IPdfGenerator
		{
			return _generator;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get orientation():PageOrientation
		{
			return _orientation;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get parentDocument():IDocument
		{
			return _parentDocument;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get size():PageSize
		{
			return _size;
		}
		
		// ========================================
		// Constructor
		// ========================================
		
		/**
		 * Constructor.
		 */
		public function AbstractPage( generator:IPdfGenerator, parentDocument:IDocument, size:PageSize, orientation:PageOrientation )
		{
			super();
			
			_generator = generator;
			_parentDocument = parentDocument;
			_size = size;
			_orientation = orientation;
		}
		
		// ========================================
		// Public Methods
		// ========================================
		
		/**
		 * @inheritDoc
		 */
		public function addDisplayObject( displayObject:DisplayObject, location:Point = null ):void
		{
			var renderer:IDisplayObjectRenderer = generator.getRenderer( displayObject );
			
			var frame:Rectangle = new Rectangle( displayObject.x, displayObject.y, displayObject.width, displayObject.height );
			
			if ( location != null )
			{
				frame.x = location.x;
				frame.y = location.y;
			}
			
			renderer.render( generator, context, displayObject, frame );
		}

		// ========================================
		// Protected Methods
		// ========================================

		/**
		 * Create a GraphicsContext
		 */
		protected function createGraphicsContext():IGraphicsContext
		{
			throw new Error( "Subclasses must implement this method." );
		}
		
		/**
		 * Calculate the bounding Rectangle for this Page.
		 */
		protected function calculateBounds():Rectangle
		{
			throw new Error( "Subclasses must implement this method." );
		}
	}
}