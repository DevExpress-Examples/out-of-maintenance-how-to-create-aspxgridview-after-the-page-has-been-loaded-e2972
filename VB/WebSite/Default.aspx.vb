Imports Microsoft.VisualBasic
Imports System
Imports DevExpress.Web

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub Page_Load()
		If (Not IsPostBack) AndAlso (Not IsCallback) Then
			hField("categoryId") = Nothing
		End If
	End Sub
	Protected Sub grid_DataBinding(ByVal sender As Object, ByVal e As EventArgs)
		'This emulates long-time data binding		
		System.Threading.Thread.Sleep(3000)
	End Sub
	Protected Sub panel1_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.CallbackEventArgsBase)
		gridCategories.Visible = True
		gridCategories.DataBind()
	End Sub
	Protected Sub panel2_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.CallbackEventArgsBase)
		gridProducts.Visible = True
	End Sub
	Protected Sub gridProducts_CustomCallback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewCustomCallbackEventArgs)
		gridProducts.DataBind()
	End Sub
	Protected Sub grid2_DataBinding(ByVal sender As Object, ByVal e As EventArgs)
		'This emulates long-time data binding. Data binding occurs only if the 'categoryId' value is set.
		If hField("categoryId") IsNot Nothing Then
			System.Threading.Thread.Sleep(3000)
		End If
	End Sub
	Protected Sub grid_Init(ByVal sender As Object, ByVal e As EventArgs)
		Dim g As ASPxGridView = TryCast(sender, ASPxGridView)
		g.Visible = g.IsCallback
	End Sub
End Class
