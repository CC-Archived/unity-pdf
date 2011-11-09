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

package com.codecatalyst.pdf.engine
{
	import com.codecatalyst.pdf.core.IDocument;
	import com.codecatalyst.pdf.IPdfGenerator;
	
	import mx.graphics.codec.IImageEncoder;

	public interface IPdfEngine
	{
		// ========================================
		// Methods
		// ========================================

		/**
		 * Create a Document.
		 */
		function createDocument( generator:IPdfGenerator, dpi:Number ):IDocument;
	}
}