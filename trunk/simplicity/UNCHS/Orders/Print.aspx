<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Print.aspx.cs" Inherits="Orders_Print" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Simplicity E & A Print Property Details</title>
    <style>
		table{
			border-spacing:0;
			border-collapse:collapse;
		}
		.heading{
			width:300px;
			border-style:solid;
			border-width:2px;
			font-weight:bolder;
			margin:0px;
			padding:0px;
			border-collapse:collapse
		}
		.detail{
			width:750px;
			border-style:solid;
			border-width:1px;
			margin:0px;
			padding:0px;
			border-collapse:collapse
		}
		tr{
			height:30px;
		}
        .tableMainFields {
            height:40px;
            font-weight:bolder;
            text-align:center;
            border-style:solid;
            border-width:2px;
            width:1052px;
        }
	</style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="tableMainFields">Property Details</div>
    <table style="border-style:solid;border-width:2px;border-color:black;">
			<tr>
				<td class="heading">
					Property Department
				</td>
				<td class="detail">
					<asp:Label ID="DepartmentPropertyLabel" runat="server" Text=""></asp:Label>
				</td>
			</tr>
			<tr>
				<td class="heading">
					Property Category
				</td>
				<td class="detail">
					<asp:Label ID="CategoryPropertyLabel" runat="server" Text=""></asp:Label>
				</td>
			</tr>
			<tr>
				<td class="heading">
					Property Address
				</td>
				<td class="detail">
					<asp:Label ID="AddressPropertyLabel" runat="server" Text=""></asp:Label>
				</td>
			</tr>
			<tr>
				<td class="heading">
					Valuation Code
				</td>
				<td class="detail">
					<asp:Label ID="ValuationCodeLabel" runat="server" Text=""></asp:Label>
				</td>
			</tr>
			<tr>
				<td class="heading">
					Property Heading
				</td>
				<td class="detail">
					<asp:Label ID="PropertyHeadingLabel" runat="server" Text=""></asp:Label>
				</td>
			</tr>
			<tr>
				<td class="heading">
					Property Detailed
				</td>
				<td class="detail">
					<asp:Label ID="PropertyDetailLabel" runat="server" Text=""></asp:Label>
				</td>
			</tr>
            <tr>
				<td class="heading">
					Property Summary
				</td>
				<td class="detail">
					<asp:Label ID="PropertySummaryLabel" runat="server" Text=""></asp:Label>
				</td>
			</tr>
			<tr>
				<td class="heading">
					Bullet Point 1
				</td>
				<td class="detail">
					<asp:Label ID="BulletPoint1Label" runat="server" Text=""></asp:Label>
				</td>
			</tr>
            <tr>
				<td class="heading">
					Bullet Point 2
				</td>
				<td class="detail">
					<asp:Label ID="BulletPoint2Label" runat="server" Text=""></asp:Label>
				</td>
			</tr>
            <tr>
				<td class="heading">
					Bullet Point 3
				</td>
				<td class="detail">
					<asp:Label ID="BulletPoint3Label" runat="server" Text=""></asp:Label>
				</td>
			</tr>
            <tr>
				<td class="heading">
					Bullet Point 4
				</td>
				<td class="detail">
					<asp:Label ID="BulletPoint4Label" runat="server" Text=""></asp:Label>
				</td>
			</tr>
            <tr>
				<td class="heading">
					Bullet Point 5
				</td>
				<td class="detail">
					<asp:Label ID="BulletPoint5Label" runat="server" Text=""></asp:Label>
				</td>
			</tr>
            <tr>
				<td class="heading">
					Bullet Point 6
				</td>
				<td class="detail">
					<asp:Label ID="BulletPoint6Label" runat="server" Text=""></asp:Label>
				</td>
			</tr>
            <tr>
				<td class="heading">
					Bullet Point 7
				</td>
				<td class="detail">
					<asp:Label ID="BulletPoint7Label" runat="server" Text=""></asp:Label>
				</td>
			</tr>
            <tr>
				<td class="heading">
					Bullet Point 8
				</td>
				<td class="detail">
					<asp:Label ID="BulletPoint8Label" runat="server" Text=""></asp:Label>
				</td>
			</tr>
		</table>
        <div class="tableMainFields">Property Rooms</div>
        <table style="border-style:solid;border-width:2px;width:1056px; border-color:black;">
            <thead style="height:40px;"><tr style="height:auto;">
                <th style="width:70px;border-style:solid;border-width:2px;">
                    Room No.
                </th>
                <th style="width:200px;border-style:solid;border-width:2px;">
                    Heading
                </th>
                <th style="width:150px;border-style:solid;border-width:2px;">
                    Dimensions
                </th>
                <th style="width:200px;border-style:solid;border-width:2px;">
                    Aspect
                </th>
                <th style="width:auto;border-style:solid;border-width:2px;">
                    Paragraph Text
                </th>
            </tr></thead>
            <tbody>
                <asp:Repeater ID="RoomsListPrint" Runat="server">
                    <ItemTemplate>
                        <tr style="height:auto;">
                            <td style="width:70px;border-style:solid;border-width:1px;word-wrap:break-word;max-width:70px;">
                                <asp:Label ID="RoomNoLabel" runat="server" Text='<%# Eval("RoomNo") %>'></asp:Label>
                            </td>
                            <td style="width:200px;border-style:solid;border-width:1px;word-wrap:break-word;max-width:200px;">
                                <asp:Label ID="RoomHeadingLabel" runat="server" Text='<%# Eval("RoomHeading") %>'></asp:Label>
                            </td>
                            <td style="width:150px;border-style:solid;border-width:1px;word-wrap:break-word;max-width:150px;">
                                <asp:Label ID="RoomDimensionLabel" runat="server" Text='<%# Eval("RoomLengthM")+"m("+Eval("RoomLengthFt")+"&#39;"+Eval("RoomLengthIn")+"\") X " + Eval("RoomWidthM")+"m("+Eval("RoomWidthFt")+"&#39;"+Eval("RoomWidthIn")+"\")"  %>'></asp:Label>
                            </td>
                            <td style="width:200px;border-style:solid;border-width:1px;word-wrap:break-word;max-width:200px;">
                                <asp:Label ID="RoomAspectLabel" runat="server" Text='<%# Eval("RoomAspect") %>'></asp:Label>
                            </td>
                            <td style="width:auto;border-style:solid;border-width:1px; word-wrap:break-word;max-width:200px;">
                                <asp:Label ID="RoomParagraphLabel" runat="server" Text='<%# Eval("RoomText") %>'></asp:Label>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </form>
</body>
</html>
