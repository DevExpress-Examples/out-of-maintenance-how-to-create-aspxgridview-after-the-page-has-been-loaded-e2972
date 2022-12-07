using System;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page
{
	protected void Page_Load() {
		if (!IsPostBack && !IsCallback)
			hField["categoryId"] = null;
	}
	protected void grid_DataBinding(object sender, EventArgs e) {
		//This emulates long-time data binding		
		System.Threading.Thread.Sleep(3000);
	}
	protected void panel1_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e) {
		gridCategories.Visible = true;
		gridCategories.DataBind();
	}
	protected void panel2_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e) {
		gridProducts.Visible = true;
	}
	protected void gridProducts_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e) {
		gridProducts.DataBind();
	}
	protected void grid2_DataBinding(object sender, EventArgs e) {
		//This emulates long-time data binding. Data binding occurs only if the 'categoryId' value is set.
		if (hField["categoryId"] != null) {
			System.Threading.Thread.Sleep(3000);
		}
	}
	protected void grid_Init(object sender, EventArgs e) {
		ASPxGridView g = sender as ASPxGridView;
		g.Visible = g.IsCallback;
	}
}
