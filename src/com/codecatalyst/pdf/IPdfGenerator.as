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
	import com.codecatalyst.pdf.engine.IPdfEngine;
	import com.codecatalyst.pdf.renderers.IDisplayObjectRenderer;
	
	import flash.display.DisplayObject;
	
	import mx.collections.ArrayCollection;
	import com.codecatalyst.pdf.core.IDocument;

	public interface IPdfGenerator
	{
		// ========================================
		// Properties
		// ========================================
		
		/**
		 * PDF engine.
		 */
		function get engine():IPdfEngine;
		
		[ArrayElementType("com.codecatalyst.pdf.renderers.IDisplayObjectRenderer")]
		/**
		 * DisplayObject renderers.
		 */
		function get renderers():ArrayCollection;
		
		// ========================================
		// Methods
		// ========================================
		
		/**
		 * Create a Document.
		 */
		function createDocument( dpi:Number ):IDocument;
		
		/**
		 * Returns the IDisplayObjectRenderer appropriate for the specified DisplayObject.
		 */		
		function getRenderer( object:DisplayObject ):IDisplayObjectRenderer;
	}
}