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

package com.codecatalyst.pdf.enum
{
	[Bindable]
	public class TextAlignment
	{		
		// ========================================
		// Public constants
		// ========================================
		
		/**
		 * Left text alignment.
		 */
		public static const LEFT:TextAlignment = new TextAlignment( "LEFT" );
		
		/**
		 * Right text alignment.
		 */
		public static const RIGHT:TextAlignment = new TextAlignment( "RIGHT" );
		
		/**
		 * Center text alignment.
		 */
		public static const CENTER:TextAlignment = new TextAlignment( "CENTER" );
		
		/**
		 * Justify text alignment.
		 */
		public static const JUSTIFY:TextAlignment = new TextAlignment( "JUSTIFY" );
		
		/**
		 * Enumerators for this enumeration.
		 */
		public static const enumerators:Array = [ LEFT, RIGHT, CENTER, JUSTIFY ];
		
		// ========================================
		// Public properties
		// ========================================
		
		/**
		 * Unique identifier.
		 */
		public var id:String;
		
		// ========================================
		// Constructor
		// ========================================
		
		/**
		 * Constructor.
		 */
		public function TextAlignment( id:String )
		{
			super();
			
			this.id = id;
		}		
	}
}