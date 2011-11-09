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

package com.codecatalyst.pdf.engine.fxpdf
{
	import com.codecatalyst.pdf.IPdfGenerator;
	import com.codecatalyst.pdf.core.AbstractPage;
	import com.codecatalyst.pdf.core.IDocument;
	import com.codecatalyst.pdf.core.IGraphicsContext;
	import com.codecatalyst.pdf.core.IPage;
	import com.codecatalyst.pdf.enum.PageOrientation;
	import com.codecatalyst.pdf.enum.PageSize;
	import com.codecatalyst.pdf.renderers.IDisplayObjectRenderer;
	
	import com.fxpdf.doc.HPDF_Doc;
	import com.fxpdf.page.HPDF_Page;
	import com.fxpdf.types.enum.HPDF_PageDirection;
	import com.fxpdf.types.enum.HPDF_PageSizes;
	
	import flash.display.DisplayObject;
	import flash.geom.Rectangle;
	
	public class FxPdfPage extends AbstractPage implements IPage
	{
		// ========================================
		// Protected Properties
		// ========================================
		
		/**
		 * Backing variable for the <code>page</code> property.
		 */
		protected var _page:HPDF_Page;

		// ========================================
		// Public Properties
		// ========================================
		
		/**
		 * FxPDF Page instance.
		 */
		public function get page():HPDF_Page
		{
			return _page;
		}
		
		// ========================================
		// Constructor
		// ========================================

		/**
		 * Constructor.
		 */
		public function FxPdfPage( generator:IPdfGenerator, parentDocument:IDocument, size:PageSize, orientation:PageOrientation )
		{
			super( generator, parentDocument, size, orientation );
			
			_page = createPage();
		}

		// ========================================
		// Protected Methods
		// ========================================
		
		/**
		 * @inheritDoc
		 */
		override protected function createGraphicsContext():IGraphicsContext
		{
			var document:HPDF_Doc = ( parentDocument as FxPdfDocument ).document;
			
			return new FxPdfGraphicsContext( document, page, parentDocument.dpi, bounds );
		}
		
		/**
		 * @inheritDoc
		 */
		override protected function calculateBounds():Rectangle
		{
			var bounds:Rectangle = new Rectangle();
			
			bounds.width = page.HPDF_Page_GetWidth();
			bounds.height = page.HPDF_Page_GetHeight();
			
			return bounds;
		}
		
		/**
		 * Create a Page in the specified Document with the specified PageSize and PageOrientation.
		 */
		protected function createPage():HPDF_Page
		{
			var document:HPDF_Doc = ( parentDocument as FxPdfDocument ).document;
			
			var page:HPDF_Page = document.HPDF_AddPage();
			page.HPDF_Page_SetSize( convertPageSize( size ), convertPageOrientation( orientation ) );
			
			return page;
		}
		
		/**
		 * Convert PageSize to HPDF_PageSizes.
		 */
		protected static function convertPageSize( size:PageSize ):uint
		{
			switch ( size )
			{
				case PageSize.LETTER:
					return HPDF_PageSizes.HPDF_PAGE_SIZE_LETTER;
				case PageSize.LEGAL: 
					return HPDF_PageSizes.HPDF_PAGE_SIZE_LEGAL;
				case PageSize.A3: 
					return HPDF_PageSizes.HPDF_PAGE_SIZE_A3;
				case PageSize.A4: 
					return HPDF_PageSizes.HPDF_PAGE_SIZE_A4;
				case PageSize.A5: 
					return HPDF_PageSizes.HPDF_PAGE_SIZE_A5;
				case PageSize.B4: 
					return HPDF_PageSizes.HPDF_PAGE_SIZE_B4;
				case PageSize.B5: 
					return HPDF_PageSizes.HPDF_PAGE_SIZE_B5;
				case PageSize.EXECUTIVE:
					return HPDF_PageSizes.HPDF_PAGE_SIZE_EXECUTIVE;
				case PageSize.US_4x6:
					return HPDF_PageSizes.HPDF_PAGE_SIZE_US4x6;
				case PageSize.US_4x8:
					return HPDF_PageSizes.HPDF_PAGE_SIZE_US4x8;
				case PageSize.US_5x7:
					return HPDF_PageSizes.HPDF_PAGE_SIZE_US5x7;
			}
			
			throw new Error( "Unsupported PageSize specified." );
		}
		
		/**
		 * Convert PageOrientation to HPDF_PageDirection.
		 */
		protected static function convertPageOrientation( orientation:PageOrientation ):uint
		{
			switch ( orientation )
			{
				case PageOrientation.PORTRAIT:
					return HPDF_PageDirection.HPDF_PAGE_PORTRAIT;
				case PageOrientation.LANDSCAPE:
					return HPDF_PageDirection.HPDF_PAGE_LANDSCAPE;
			}
			
			throw new Error( "Unsupported PageOrientation specified." );
		}
	}
}