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
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Rectangle;

	public class DisplayObjectContainerRenderer extends AbstractDisplayObjectRenderer implements IDisplayObjectRenderer
	{
		// ========================================
		// Constructor
		// ========================================
		
		/**
		 * Constructor.
		 */
		public function DisplayObjectContainerRenderer()
		{
			super( DisplayObjectContainer );
		}
		
		// ========================================
		// Public Methods
		// ========================================
		
		/**
		 * @inheritDoc
		 */
		override public function render( generator:IPdfGenerator, context:IGraphicsContext, displayObject:DisplayObject, frame:Rectangle ):void
		{
			var container:DisplayObjectContainer = displayObject as DisplayObjectContainer;
			
			if ( container.visible )
			{
				// TODO: render self?
				
				var childCount:int = container.numChildren;
				for ( var childIndex:int=0; childIndex < childCount; childIndex++)
				{
					var child:DisplayObject = container.getChildAt( childIndex );
					
					var childFrame:Rectangle = new Rectangle( child.x, child.y, child.width, child.height );
					childFrame.offsetPoint( frame.topLeft );
					
					var renderer:IDisplayObjectRenderer = generator.getRenderer( child );
					renderer.render( generator, context, child, childFrame );
				}
			}			
		}
	}
}