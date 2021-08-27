<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128538731/10.2.5%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E2972)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
<!-- default file list end -->
# How to create ASPxGridView after the page has been loaded
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/e2972/)**
<!-- run online end -->


<p>Suppose that we have two ASPxGridView's with  huge data to display in its rows. Data binding takes several seconds (in this example it is emulated with the Thread.Sleep() function in the DataBinding event handler). The example demonstrates how to get a page without grids so it is loaded fast and then immediately bind grids to their datasources at runtime. </p><p>See also<br />
<a href="https://www.devexpress.com/Support/Center/p/E1907">How to conditionally create controls via callbacks using the ASPxCallbackPanel</a></p>

<br/>


