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
	import flash.geom.Rectangle;
	
	import mx.containers.FormItem;
	import mx.controls.Label;

	public class FormItemRenderer extends ContainerRenderer implements IDisplayObjectRenderer
	{
		// ========================================
		// Constructor
		// ========================================

		/**
		 * @inheritDoc
		 */
		override public function get type():Class
		{
			return FormItem;
		}
		
		// ========================================
		// Constructor
		// ========================================
		
		/**
		 * Constructor.
		 */
		public function FormItemRenderer()
		{
			super();
		}
		
		// ========================================
		// Public Methods
		// ========================================
		
		/**
		 * @inheritDoc
		 */
		override public function render( generator:IPdfGenerator, context:IGraphicsContext, displayObject:DisplayObject, frame:Rectangle ):void
		{
			var formItem:FormItem = displayObject as FormItem;
			
			if ( formItem.visible )
			{
				var label:mx.controls.Label = formItem.itemLabel;
				
				var labelFrame:Rectangle = new Rectangle( label.x, label.y, label.width, label.height );
				labelFrame.offsetPoint( frame.topLeft );
				
				var renderer:IDisplayObjectRenderer = generator.getRenderer( label );
				renderer.render( generator, context, label, labelFrame );
				
				super.render( generator, context, displayObject, frame );
			}			
		}
	}
}