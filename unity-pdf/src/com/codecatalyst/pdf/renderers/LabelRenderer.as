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
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.text.TextLineMetrics;
	
	import mx.controls.Label;
	import mx.core.UITextField;
	import mx.core.mx_internal;

	use namespace mx_internal;
	
	public class LabelRenderer extends AbstractDisplayObjectRenderer
	{
		// ========================================
		// Constructor
		// ========================================
		
		/**
		 * Constructor.
		 */
		public function LabelRenderer()
		{
			super( Label );
		}
		
		// ========================================
		// Public Methods
		// ========================================
		
		/**
		 * @inheritDoc
		 */
		override public function render( generator:IPdfGenerator, context:IGraphicsContext, displayObject:DisplayObject, frame:Rectangle ):void
		{
			var label:Label = displayObject as Label;
			
			if ( !label.visible )
				return;
			
			var fontFamily:String 	= label.getStyle( "fontFamily" );
			var fontSize:Number 	= label.getStyle( "fontSize" );
			var color:uint 			= label.getStyle( ( label.enabled ? "color" : "disabledColor" ) );
			
			var bold:Boolean 		= ( label.getStyle( "fontWeight" ) == "bold" );
			var underline:Boolean 	= ( label.getStyle( "textDecoration" ) == "underline" );
			
			var textAlign:String    = label.getStyle( "textAlign" );
			
			// TODO: implement font mapping
			fontFamily = "Helvetica";

			var fontName:String = ( bold ) ? fontFamily + "-Bold" : fontFamily;
			var alignment:TextAlignment = convertAlignment( textAlign );
			
			// render
			
			context.setFont( fontName, fontSize );
			context.setTextColor( color );

			// traverse and render the lines of the underlying UITextField
			
			var textField:UITextField = label.getTextField() as UITextField;
			
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
		 * Convert Label 'textAlign' style value into TextAlignment.
		 */
		protected function convertAlignment( alignment:String ):TextAlignment
		{
			switch ( alignment )
			{
				case "left":
					return TextAlignment.LEFT;
				case "right":
					return TextAlignment.RIGHT;
				case "center":
					return TextAlignment.CENTER;
			}
			
			throw new Error( "Unsupported alignment specified." );
		}
	}
}