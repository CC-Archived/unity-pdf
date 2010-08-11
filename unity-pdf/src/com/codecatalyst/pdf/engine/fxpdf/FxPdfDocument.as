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
	import com.codecatalyst.pdf.core.AbstractDocument;
	import com.codecatalyst.pdf.core.IDocument;
	import com.codecatalyst.pdf.core.IPage;
	import com.codecatalyst.pdf.enum.PageOrientation;
	import com.codecatalyst.pdf.enum.PageSize;
	
	import com.fxpdf.doc.HPDF_Doc;
	import com.fxpdf.streams.HPDF_MemStreamAttr;
	
	import flash.utils.ByteArray;
	
	public class FxPdfDocument extends AbstractDocument implements IDocument
	{
		// ========================================
		// Protected Properties
		// ========================================
		
		/**
		 * Backing variable for the <code>document</code> property.
		 */
		protected var _document:HPDF_Doc;

		// ========================================
		// Protected Properties
		// ========================================

		/**
		 * FxPDF Document instance.
		 */		
		public function get document():HPDF_Doc
		{
			return _document;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get bytes():ByteArray
		{
			document.HPDF_SaveToStream();
			
			var memory:HPDF_MemStreamAttr = document.stream.attr as HPDF_MemStreamAttr;
			memory.buf.position = 0;
			
			return memory.buf;
		}
		
		// ========================================
		// Constructor
		// ========================================
		
		/**
		 * Constructor.
		 */
		public function FxPdfDocument( generator:IPdfGenerator, dpi:Number = 300 )
		{
			super( generator, dpi );
			
			_document = new HPDF_Doc();
		}
		
		// ========================================
		// Public methods
		// ========================================

		/**
		 * @inheritDoc
		 */
		override public function createPage( size:PageSize, orientation:PageOrientation ):IPage
		{
			return new FxPdfPage( generator, this, size, orientation );
		}
	}
}