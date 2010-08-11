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

package com.codecatalyst.pdf.renderers
{
	import com.codecatalyst.pdf.IPdfGenerator;
	import com.codecatalyst.pdf.core.IGraphicsContext;
	import com.codecatalyst.pdf.enum.TextAlignment;
	
	import flash.display.DisplayObject;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.text.TextLineMetrics;
	
	public class TextFieldRenderer extends AbstractDisplayObjectRenderer implements IDisplayObjectRenderer
	{
		// ========================================
		// Constructor
		// ========================================	
		
		/**
		 * Constructor
		 */
		public function TextFieldRenderer()
		{
			super( TextField );
		}
		
		// ========================================
		// Public Methods
		// ========================================	
		
		/**
		 * @inheritDoc
		 */
		override public function render( generator:IPdfGenerator, context:IGraphicsContext, displayObject:DisplayObject, frame:Rectangle ):void
		{
			var textField:TextField = displayObject as TextField;

			// TODO: rewrite to use getTextRuns()
			
			var textFormat:TextFormat = textField.getTextFormat();
			
			var font:String = textFormat.font;
			var alignment:TextAlignment = convertAlignment( textFormat.align );
			
			// TODO: implement font mapping

			font = "Helvetica";
			var fontName:String = ( textFormat.bold ) ? font + "-Bold" : font;
			
			// render
			
			context.setFont( fontName, textFormat.size as Number );
			context.setTextColor( textFormat.color as uint );
			
			// traverse and render the text lines
			
			var lineY:Number = 4;
			
			var lineCount:int = textField.numLines;
			for ( var lineIndex:int = 0; lineIndex < lineCount; lineIndex++ )
			{
				var lineText:String = textField.getLineText( lineIndex );
				var lineMetrics:TextLineMetrics = textField.getLineMetrics( lineIndex );
				
				var lineFrame:Rectangle = 
					new Rectangle( 
						frame.x + textField.x + lineMetrics.x, 
						frame.y + textField.y + lineY,
						lineMetrics.width,
						lineMetrics.height 
					);
				
				context.writeTextInsideRectangle( lineText, lineFrame, alignment );
				
				lineY += lineMetrics.height;
			}
		}

		// ========================================
		// Protected Methods
		// ========================================	
		
		/**
		 * Convert a TextFormat <code>align</code> property value into TextAlignment.
		 */
		protected function convertAlignment( alignment:String ):TextAlignment
		{
			switch ( alignment )
			{
				case TextFormatAlign.LEFT:
					return TextAlignment.LEFT;
				case TextFormatAlign.RIGHT:
					return TextAlignment.RIGHT;
				case TextFormatAlign.CENTER:
					return TextAlignment.CENTER;
				case TextFormatAlign.JUSTIFY:
					return TextAlignment.JUSTIFY;
			}
			
			throw new Error( "Unsupported alignment specified." );
		}	
	}
}