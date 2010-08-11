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
	public class Color
	{
		// ========================================
		// Protected Properties
		// ========================================
		
		/**
		 * ARGB value.
		 */
		protected var color:uint;
		
		// ========================================
		// Public Properties
		// ========================================
		
		/**
		 * Alpha color component, expressed as a value between 0.0 and 1.0.
		 */
		public function get alpha():Number
		{
			return ( ( color >> 24 ) & 0xFF ) / 255.0;
		}
		
		public function set alpha( value:Number ):void
		{
			var component:Number = uint( 255 * value ) % 256;
			
			color = ( ( component & 0xFF ) << 24 ) | ( color & 0x00FFFFFF );
		}
		
		/**
		 * Red color component, expressed as value between 0.0 and 1.0.
		 */
		public function get red():Number
		{
			return ( ( color >> 16 ) & 0xFF ) / 255.0;
		}
		
		public function set red( value:Number ):void
		{
			var component:Number = uint( 255 * value ) % 256;
			
			color = ( ( component & 0xFF ) << 16 ) | ( color & 0xFF00FFFF );
		}
		
		/**
		 * Green color component, expressed as value between 0.0 and 1.0.
		 */
		public function get green():Number
		{
			return ( ( color >> 8 ) & 0xFF ) / 255;
		}
		
		public function set green( value:Number ):void
		{
			var component:Number = uint( 255 * value ) % 256;
			
			color = ( ( component & 0xFF ) << 8 ) | ( color & 0xFFFF00FF );
		}
		
		/**
		 * Blue color component, expressed as value between 0.0 and 1.0.
		 */
		public function get blue():Number
		{
			return ( color & 0xFF ) / 255.0;
		}
		
		public function set blue( value:Number ):void
		{
			var component:Number = uint( 255 * value ) % 256;
			
			color = ( component & 0xFF ) | ( color & 0xFFFFFF00 );
		}
		
		/**
		 * Color value, expressed as an RGB hex value.
		 */
		public function get rgbHex():uint
		{
			return color & 0x00ffffff;
		}
		
		public function set rgbHex( value:uint ):void
		{
			color = ( 0xFF << 24 ) | ( value & 0xFFFFFF );
		}
		
		/**
		 * Color value, expressed as an ARGB hex value.
		 */
		public function get argbHex():uint
		{
			return color;
		}
		
		public function set argbHex( value:uint ):void
		{
			color = value;
		}
		
		// ========================================
		// Constructor
		// ========================================
		
		/**
		 * Constructor.
		 */
		public function Color( ... args )
		{
			super();
			
			if ( args.length == 0 )
			{
				color  = 0xFF000000;
			}
			if ( args.length == 1 )
			{
				rgbHex = uint( args[0] );
			}
			else if ( args.length == 3 )
			{
				red    = Number( args[ 0 ] );
				green  = Number( args[ 1 ] );
				blue   = Number( args[ 2 ] );
			}
			else
			{
				throw new Error( "Unsupported argument(s) were specified." );
			}
		}
	}
}