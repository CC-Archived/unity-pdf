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

package com.codecatalyst.pdf
{
	import com.codecatalyst.pdf.core.IDocument;
	import com.codecatalyst.pdf.engine.IPdfEngine;
	import com.codecatalyst.pdf.renderers.*;
	
	import flash.display.DisplayObject;
	import flash.utils.getQualifiedClassName;
	
	import mx.collections.ArrayCollection;
	
	public class PdfGenerator implements IPdfGenerator
	{
		// ========================================
		// Protected Properties
		// ========================================
		
		/**
		 * Backing variable for the <code>engine</code> property.
		 */
		protected var _engine:IPdfEngine;
		
		[ArrayElementType("com.codecatalyst.pdf.renderers.IDisplayObjectRenderer")]
		/**
		 * Backing variable for the <code>renderers</code> property.
		 */
		protected var _renderers:ArrayCollection;
		
		// ========================================
		// Public Properties
		// ========================================
		
		/**
		 * @inheritDoc
		 */
		public function get engine():IPdfEngine
		{
			return _engine;
		}
		
		[ArrayElementType("com.codecatalyst.pdf.renderers.IDisplayObjectRenderer")]
		/**
		 * @inheritDoc
		 */
		public function get renderers():ArrayCollection
		{
			return _renderers;
		}
		
		// ========================================
		// Constructor
		// ========================================
		
		/**
		 * Constructor.
		 */
		public function PdfGenerator( engine:IPdfEngine )
		{
			super();
			
			_engine = engine;
			
			_renderers = new ArrayCollection();
			
			// TODO: Extract Flex renderers to seperate package / SWC
			// TODO: Provide easy way to bulk add renderer sets.
			
			// Flex-specific renderers
			
			_renderers.addItem( new FormItemRenderer() );
			_renderers.addItem( new LabelRenderer() );
			_renderers.addItem( new ContainerRenderer() );
			_renderers.addItem( new UIComponentRenderer() );
			
			// Core Flash specific renderers.
			
			_renderers.addItem( new TextFieldRenderer() );
			_renderers.addItem( new DisplayObjectContainerRenderer() );
			_renderers.addItem( new DisplayObjectRenderer() );
		}
		
		// ========================================
		// Public Methods
		// ========================================
		
		/**
		 * @inheritDoc
		 */
		public function createDocument( dpi:Number ):IDocument
		{
			return engine.createDocument( this, dpi );
		}
				
		/**
		 * @inheritDoc
		 */
		public function getRenderer( object:DisplayObject ):IDisplayObjectRenderer
		{
			for each ( var renderer:IDisplayObjectRenderer in renderers )
			{
				if ( object is renderer.type )
					return renderer;
			}
			
			throw new Error( "No renderer available to render DisplayObject of type: " + getQualifiedClassName( object ) );
		}
	}
}