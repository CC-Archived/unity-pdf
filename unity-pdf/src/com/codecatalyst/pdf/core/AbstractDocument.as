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
	
	import flash.utils.ByteArray;
	
	public class AbstractDocument implements IDocument
	{
		// ========================================
		// Protected Properties
		// ========================================
		
		/**
		 * Backing variable for <code>dpi</code> property.
		 */
		protected var _dpi:Number;
		
		/**
		 * Backing variable for the <code>generator</code> property.
		 */
		protected var _generator:IPdfGenerator;
		
		// ========================================
		// Protected Properties
		// ========================================
		
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
		public function get generator():IPdfGenerator
		{
			return _generator;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get bytes():ByteArray
		{
			throw new Error( "Subclasses must implement this method." );
		}
		
		// ========================================
		// Constructor
		// ========================================
		
		/**
		 * Constructor.
		 */
		public function AbstractDocument( generator:IPdfGenerator, dpi:Number = 300 )
		{
			super();
			
			_generator = generator;
			_dpi = dpi;
		}
		
		// ========================================
		// Public methods
		// ========================================
		
		/**
		 * @inheritDoc
		 */
		public function createPage( size:PageSize, orientation:PageOrientation ):IPage
		{
			throw new Error( "Subclasses must implement this method." );
		}
	}
}