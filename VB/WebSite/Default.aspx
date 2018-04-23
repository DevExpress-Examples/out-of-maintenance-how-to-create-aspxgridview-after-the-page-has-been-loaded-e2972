<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v10.2, Version=10.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v10.2, Version=10.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
	<title>How to create ASPxGridView after the page has been loaded.</title>
</head>
<script language="javascript" type="text/javascript">	
	function OnFocusedRowChanged(s, e) {        
		hField.Set("categoryId", s.GetRowKey(s.GetFocusedRowIndex()));
		gridProducts.PerformCallback();
	}
	function OnGetRowValues(values) {
		panel2.PerformCallback(values);
	}
</script>

<body>
	<form id="form1" runat="server">
		<br />
		<br />
		<table style="width: 1000px;">
			<tr>
				<td valign="top" style="width: 40%">
					<dx:ASPxCallbackPanel ID="panel1" runat="server" OnCallback="panel1_Callback" ClientInstanceName="panel1">
						<ClientSideEvents Init="function(s, e) { s.PerformCallback(); }" />
						<PanelCollection>
							<dx:PanelContent ID="PanelContent2" runat="server" SupportsDisabledAttribute="True">
								<dx:ASPxGridView ID="gridCategories" runat="server" AutoGenerateColumns="False" DataSourceID="dsCategories"
									KeyFieldName="CategoryID" OnDataBinding="grid_DataBinding" Visible="false">
									<ClientSideEvents FocusedRowChanged="OnFocusedRowChanged" />
									<Columns>
										<dx:GridViewDataTextColumn FieldName="CategoryID" ReadOnly="True" ShowInCustomizationForm="True"
											VisibleIndex="0" Visible="False">
											<EditFormSettings Visible="False" />
										</dx:GridViewDataTextColumn>
										<dx:GridViewDataTextColumn FieldName="CategoryName" ShowInCustomizationForm="True"
											VisibleIndex="1">
										</dx:GridViewDataTextColumn>
										<dx:GridViewDataTextColumn FieldName="Description" ShowInCustomizationForm="True"
											VisibleIndex="2" Width="200px">
										</dx:GridViewDataTextColumn>
									</Columns>
									<SettingsBehavior AllowFocusedRow="True" />
									<SettingsPager PageSize="5" ShowEmptyDataRows="True">
									</SettingsPager>
								</dx:ASPxGridView>
							</dx:PanelContent>
						</PanelCollection>
					</dx:ASPxCallbackPanel>
				</td>
				<td valign="top" style="width: 60%">
					<dx:ASPxCallbackPanel ID="panel2" runat="server" OnCallback="panel2_Callback" ClientInstanceName="panel2">
						<ClientSideEvents Init="function(s, e) { s.PerformCallback(); }" />
						<PanelCollection>
							<dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttribute="True">
								<dx:ASPxGridView ID="gridProducts" runat="server" AutoGenerateColumns="False" KeyFieldName="ProductID"
									OnDataBinding="grid2_DataBinding" Visible="False" ClientInstanceName="gridProducts"
									OnCustomCallback="gridProducts_CustomCallback" DataSourceID="dsProducts" OnInit="grid_Init">
									<Columns>
										<dx:GridViewDataTextColumn FieldName="ProductID" ReadOnly="True" ShowInCustomizationForm="True"
											VisibleIndex="0" Visible="False">
											<EditFormSettings Visible="False" />
										</dx:GridViewDataTextColumn>
										<dx:GridViewDataTextColumn FieldName="ProductName" ShowInCustomizationForm="True"
											VisibleIndex="1" Width="300px">
										</dx:GridViewDataTextColumn>
										<dx:GridViewDataTextColumn FieldName="CategoryID" ShowInCustomizationForm="True"
											VisibleIndex="2">
										</dx:GridViewDataTextColumn>
										<dx:GridViewDataTextColumn FieldName="UnitPrice" ShowInCustomizationForm="True" VisibleIndex="3">
										</dx:GridViewDataTextColumn>
										<dx:GridViewDataTextColumn FieldName="UnitsInStock" ShowInCustomizationForm="True"
											VisibleIndex="4">
										</dx:GridViewDataTextColumn>
										<dx:GridViewDataTextColumn FieldName="UnitsOnOrder" ShowInCustomizationForm="True"
											VisibleIndex="5">
										</dx:GridViewDataTextColumn>
									</Columns>
									<SettingsPager PageSize="5" ShowEmptyDataRows="True">
									</SettingsPager>
								</dx:ASPxGridView>
							</dx:PanelContent>
						</PanelCollection>
					</dx:ASPxCallbackPanel>
				</td>
			</tr>
		</table>
		<asp:SqlDataSource ID="dsCategories" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
			SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]">
		</asp:SqlDataSource>
		<dx:ASPxHiddenField ID="hField" runat="server" ClientInstanceName="hField">
		</dx:ASPxHiddenField>
		<asp:SqlDataSource ID="dsProducts" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
			SelectCommand="SELECT [ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsInStock], [UnitsOnOrder] FROM [Products] WHERE ([CategoryID] = @CategoryID)">
			<SelectParameters>
				<asp:ControlParameter Name="CategoryID" ControlID="hField" PropertyName="['categoryId']"
					Type="Int32" />
			</SelectParameters>
		</asp:SqlDataSource>
	</form>
</body>
</html>
