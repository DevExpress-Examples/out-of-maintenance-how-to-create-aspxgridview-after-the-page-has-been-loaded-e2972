<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
<!-- default file list end -->
# How to create ASPxGridView after the page has been loaded


<p>Suppose that we have two ASPxGridView's with  huge data to display in its rows. Data binding takes several seconds (in this example it is emulated with the Thread.Sleep() function in the DataBinding event handler). The example demonstrates how to get a page without grids so it is loaded fast and then immediately bind grids to their datasources at runtime. </p><p>See also<br />
<a href="https://www.devexpress.com/Support/Center/p/E1907">How to conditionally create controls via callbacks using the ASPxCallbackPanel</a></p>

<br/>


