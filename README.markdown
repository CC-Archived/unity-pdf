# UnityPDF

UnityPDF is an extensible ActionScript 3.0 library that simplifies the task of creating PDF files from Adobe Flex MXML and pure ActionScript components.  

UnityPDF provides a high-level API for creating Documents, Pages and adding components to those pages.  Components are rendered to PDF using an extensible set of 'renderer' plugins which are capable of crawling complex display list hieararchies and identifying the ideal renderer plugin to create corresponding PDF output.

UnityPDF provides an alternative to manually writing programatic code against a specific PDF engine's API.  Internally, UnityPDF implements an abstraction layer to allow interchangeable use of any of the three major ActionScript 3.0 based PDF creation engines (AlivePDF, PurePDF and FxPDF).

UnityPDF is suitable for use in Flash, pure ActionScript or Flex projects.

## Version History

**Version 0.5**

*   FxPDF support
*   Renderers for:
    *   Label
    *   FormItem
    *   UIComponent
    *   Container
    *   DisplayObjectContainer 
    *   DisplayObject
    *   TextField
*   Bitmap capture of complex components at configurable DPI
*   Basic text layout and rendering from Label and TextField components

## Roadmap

Upcoming enhancements:

*   AlivePDF and PurePDF support
*   font mapping and substitution
*   headers and footers
*   rendering of Degrafa content as vector graphics

## License

> Copyright © 2010 CodeCatalyst, LLC - <http://www.codecatalyst.com/>
>  
> Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License. You may obtain a copy of the License at
> 
> <http://www.apache.org/licenses/LICENSE-2.0>
> 
> Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.