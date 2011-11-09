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
	public class PageSize
	{		
		// ========================================
		// Public constants
		// ========================================
		
		/**
		 * Letter page size.
		 */
		public static const LETTER:PageSize = new PageSize( "LETTER" );
		
		/**
		 * Legal page size.
		 */
		public static const LEGAL:PageSize = new PageSize( "LEGAL" );
		
		/**
		 * A3 page size.
		 */
		public static const A3:PageSize = new PageSize( "A3" );
		
		/**
		 * A4 page size.
		 */
		public static const A4:PageSize = new PageSize( "A4" );
		
		/**
		 * A5 page size.
		 */
		public static const A5:PageSize = new PageSize( "A5" );
		
		/**
		 * B4 page size.
		 */
		public static const B4:PageSize = new PageSize( "B4" );
		
		/**
		 * B5 page size.
		 */
		public static const B5:PageSize = new PageSize( "B5" );
		
		/**
		 * Executive page size.
		 */
		public static const EXECUTIVE:PageSize = new PageSize( "EXECUTIVE" );
		
		/**
		 * US 4x6 page size.
		 */
		public static const US_4x6:PageSize = new PageSize( "US4x6" );
		
		/**
		 * US 4x8 page size.
		 */
		public static const US_4x8:PageSize = new PageSize( "US4x8" );
		
		/**
		 * US 5x7 page size.
		 */
		public static const US_5x7:PageSize = new PageSize( "US5x7" );
		
		/**
		 * Enumerators for this enumeration.
		 */
		public static const  enumerators:Array = [ LETTER, LEGAL, A3, A4, A5, B4, B5, EXECUTIVE, US_4x6, US_4x8, US_5x7 ];
		
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
		public function PageSize( id:String )
		{
			super();
			
			this.id = id;
		}
	}
}