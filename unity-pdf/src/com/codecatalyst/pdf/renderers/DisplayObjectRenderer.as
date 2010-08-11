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
	import com.codecatalyst.pdf.graphics.ImageSnapshot;
	
	import flash.display.DisplayObject;
	import flash.geom.Rectangle;
	
	public class DisplayObjectRenderer extends AbstractDisplayObjectRenderer
	{
		// ========================================
		// Constructor
		// ========================================
		
		/**
		 * Constructor.
		 */
		public function DisplayObjectRenderer()
		{
			super( DisplayObject );
		}
		
		// ========================================
		// Public Methods
		// ========================================
		
		/**
		 * @inheritDoc
		 */
		override public function render( generator:IPdfGenerator, context:IGraphicsContext, displayObject:DisplayObject, frame:Rectangle ):void
		{
			if ( !displayObject.visible )
				return;
			
			if ( ( displayObject.width > 0 ) && ( displayObject.height > 0 ) )
			{				
				var image:ImageSnapshot = ImageSnapshot.captureImage( displayObject, context.dpi, context.imageEncoder, true, true, 0xFFFFFFFF );
				
				context.drawImageAtPoint( image.data, frame.topLeft, frame.width, frame.height );
			}
		}		
	}
}