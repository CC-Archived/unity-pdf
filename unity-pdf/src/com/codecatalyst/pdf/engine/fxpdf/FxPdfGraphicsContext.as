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
	import com.codecatalyst.pdf.codec.PNGEncoder;
	import com.codecatalyst.pdf.core.AbstractGraphicsContext;
	import com.codecatalyst.pdf.core.IGraphicsContext;
	import com.codecatalyst.pdf.enum.TextAlignment;
	
	import com.fxpdf.doc.HPDF_Doc;
	import com.fxpdf.font.HPDF_Font;
	import com.fxpdf.image.HPDF_Image;
	import com.fxpdf.page.HPDF_Page;
	import com.fxpdf.types.enum.HPDF_TextAlignment;
	
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	
	import mx.graphics.codec.IImageEncoder;
	
	public class FxPdfGraphicsContext extends AbstractGraphicsContext implements IGraphicsContext
	{
		// ========================================
		// Protected Constants
		// ========================================
		
		/**
		 * Screen Points Per Inch.
		 */
		protected static const SCREEN_PPI:Number = 72;
		
		/**
		 * Screen Dots Per Inch.
		 */
		protected static const SCREEN_DPI:Number = 96;
		
		/**
		 * Image encoder.
		 */
		protected static const IMAGE_ENCODER:IImageEncoder = new PNGEncoder();
		
		// ========================================
		// Public Properties
		// ========================================
		
		/**
		 * Backing variable for the <code>document</code> property.
		 */
		protected var _document:HPDF_Doc;
		
		/**
		 * Backing variable for the <code>page</code> property.
		 */
		protected var _page:HPDF_Page;
		
		// ========================================
		// Public Properties
		// ========================================

		/**
		 * FxPDF Document instance.
		 */
		public function get document():HPDF_Doc
		{
			return _document;
		}
		
		/**
		 * FxPDF Page instance.
		 */
		public function get page():HPDF_Page
		{
			return _page;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get imageEncoder():IImageEncoder
		{
			return IMAGE_ENCODER;
		}

		// ========================================
		// Constructor.
		// ========================================

		/**
		 * Constructor.
		 */
		public function FxPdfGraphicsContext( document:HPDF_Doc, page:HPDF_Page, dpi:Number, bounds:Rectangle )
		{
			super( dpi, bounds );
			
			_document = document;
			_page = page;
		}
		
		// ========================================
		// Public Methods
		// ========================================
		
		/**
		 * @inheritDoc
		 */
		override public function drawImageAtPoint( imageBytes:ByteArray, point:Point, width:Number, height:Number ):void
		{
			var translatedPoint:Point = translatePoint( point );
			
			var image:HPDF_Image = document.HPDF_LoadPngImageFromByteArray( imageBytes );
			
			page.HPDF_Page_DrawImage( image, translatedPoint.x, translatedPoint.y - height, width, height );
		}
		
		/**
		 * @inheritDoc
		 */
		override public function setFont( fontName:String, size:Number ):void
		{
			var translatedSize:Number = translateFontSize( size );
			
			var font:HPDF_Font = document.HPDF_GetFont( fontName, null );
			page.HPDF_Page_SetFontAndSize ( font, translatedSize );
		}
		
		/**
		 * @inheritDoc
		 */
		override public function setTextColor( color:uint ):void
		{
			var fillColor:Color = new Color( color );
			
			page.HPDF_Page_SetRGBFill( fillColor.red, fillColor.green, fillColor.blue );
		}
		
		/**
		 * @inheritDoc
		 */
		override public function writeTextAtPoint( text:String, point:Point ):void
		{
			var translatedPoint:Point = translatePoint( point );
			
			page.HPDF_Page_BeginText();
			page.HPDF_Page_TextOut( translatedPoint.x, translatedPoint.y, text );
			page.HPDF_Page_EndText();
		}
		
		/**
		 * @inheritDoc
		 */
		override public function writeTextInsideRectangle( text:String, rectangle:Rectangle, alignment:TextAlignment ):void
		{
			var translatedRectangle:Rectangle = translateRectangle( rectangle );
			
			var translatedAlignment:int = translateTextAlignment( alignment );
			// TODO: add support for alignment
			
			page.HPDF_Page_BeginText();
			page.HPDF_Page_TextRect( translatedRectangle.left, translatedRectangle.top, translatedRectangle.right, translatedRectangle.bottom, text, translatedAlignment, 0 );
			page.HPDF_Page_EndText();
		}
		
		// ========================================
		// Protected Methods
		// ========================================
		
		/**
		 * Translates screen font size (px) to print font size (pt).
		 */
		protected function translateFontSize( size:Number ):Number
		{
			return size * ( SCREEN_PPI / SCREEN_DPI );
		}
		
		/**
		 * Translates Rectangle screen coordinates to print coordinates.
		 */
		protected function translateRectangle( rectangle:Rectangle ):Rectangle
		{
			var topLeft:Point     = translatePoint( rectangle.topLeft );
			var bottomRight:Point = translatePoint( rectangle.bottomRight );
			
			var translatedRectangle:Rectangle = new Rectangle();
			translatedRectangle.top    = topLeft.y;
			translatedRectangle.left   = topLeft.x;
			translatedRectangle.bottom = bottomRight.y;
			translatedRectangle.right  = bottomRight.x;
			
			return translatedRectangle;
		}
		
		/**
		 * Translates Point screen coordinate to print coordinate.
		 */
		protected function translatePoint( point:Point ):Point
		{
			return new Point( point.x, page.HPDF_Page_GetHeight() - point.y );
		}
		
		/**
		 * Translates the specified TextAlignment into the cooresponding FxPDF text alignment constant.
		 */
		protected function translateTextAlignment( alignment:TextAlignment ):int
		{
			switch ( alignment )
			{
				case TextAlignment.LEFT:
					return HPDF_TextAlignment.HPDF_TALIGN_LEFT;
				case TextAlignment.RIGHT:
					return HPDF_TextAlignment.HPDF_TALIGN_RIGHT;
				case TextAlignment.CENTER:
					return HPDF_TextAlignment.HPDF_TALIGN_CENTER;
				case TextAlignment.JUSTIFY:
					return HPDF_TextAlignment.HPDF_TALIGN_JUSTIFY;
					
				default:
					throw new Error( "An unsupported alignment was specified." );
			}
		}	
	}
}