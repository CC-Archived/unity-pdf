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
	
	import flash.display.DisplayObject;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	public interface IPage
	{
		// ========================================
		// Properties
		// ========================================
		
		/**
		 * Bounding rectangle for this Page.
		 */
		function get bounds():Rectangle
		
		/**
		 * Graphics Context for this Page.
		 */
		function get context():IGraphicsContext;
		
		/**
		 * PDF Generator.
		 */
		function get generator():IPdfGenerator;
		
		/**
		 * Page Orientation.
		 */
		function get orientation():PageOrientation;
		
		/**
		 * Page Size.
		 */
		function get size():PageSize;
		
		/**
		 * Parent Document.
		 */
		function get parentDocument():IDocument;
		
		// ========================================
		// Methods
		// ========================================
		
		/**
		 * Add the specified DisplayObject to this Page at the specified location (optional).
		 */
		function addDisplayObject( object:DisplayObject, location:Point = null ):void;
	}
}