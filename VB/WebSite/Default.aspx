<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>





<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

	<script type="text/javascript">
		var focusedItemId;
		function onClick(event) {
			event.currentTarget.style.backgroundColor = "yellow";
			if (focusedItemId != null)
				if (event.currentTarget.id != focusedItemId)
					document.getElementById(focusedItemId).style.backgroundColor = "transparent";
			focusedItemId = event.currentTarget.id;
		};
	</script>
	<title></title>
</head>
<body>
	<form id="form1" runat="server">
		<dx:ASPxDataView ID="ASPxDataView1" runat="server" DataSourceID="ads">
			<PagerSettings ShowNumericButtons="False"></PagerSettings>
			<ItemStyle Paddings-Padding="0" />
			<ItemTemplate>
				<div id='<%#"containerDiv" & Container.ItemIndex%>' onclick="onClick(event)" style="padding: 10px 10px 10px 10px; height: 200px">
					<b>CategoryName</b>:
				<asp:Label ID="CategoryNameLabel" runat="server" Text='<%#Eval("CategoryName")%>' />
					<br />
					<b>Description</b>:
				<asp:Label ID="DescriptionLabel" runat="server" Text='<%#Eval("Description")%>' />
					<br />
					<dx:ASPxBinaryImage ID="ASPxBinaryImage1" runat="server" Value='<%#Eval("Picture")%>'></dx:ASPxBinaryImage>
					<br />
				</div>
			</ItemTemplate>
		</dx:ASPxDataView>
		<asp:AccessDataSource ID="ads" runat="server" DataFile="~/App_Data/nwind.mdb" SelectCommand="SELECT * FROM [Categories]"></asp:AccessDataSource>
	</form>
</body>
</html>