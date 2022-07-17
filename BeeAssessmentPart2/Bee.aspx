<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bee.aspx.cs" Inherits="BeeAssessmentPart2.Bee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <style type="text/css">
        .Initial {
            display: block;
            padding: 4px 18px 4px 18px;
            float: left;
            background: url("images/tabNotActive.png") no-repeat right top;
            color: Black;
            font-weight: bold;
        }

            .Initial:hover {
                color: White;
                background: url("images/tabActive.png") no-repeat right top;
            }

        .Clicked {
            float: left;
            display: block;
            background: url("images/tabActive.png") no-repeat right top;
            padding: 4px 18px 4px 18px;
            color: Black;
            font-weight: bold;
            color: White;
        }
    </style>
    <form id="form1" runat="server">
        <div>
            <table width="80%" align="center">
                <tr>
                    <td>
                        <asp:Button Text="Worker Bee" BorderStyle="None" ID="Tab1" CssClass="Initial" runat="server"
                            OnClick="Tab1_Click" />
                        <asp:Button Text="Queen Bee" BorderStyle="None" ID="Tab2" CssClass="Initial" runat="server"
                            OnClick="Tab2_Click" />
                        <asp:Button Text="Drone Bee" BorderStyle="None" ID="Tab3" CssClass="Initial" runat="server"
                            OnClick="Tab3_Click" />
                        <asp:MultiView ID="MainView" runat="server">
                            <asp:View ID="View1" runat="server">

                                <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                                    <tr>
                                        <td>
                                            <h3>
                                                <asp:ListView ID="WorkerBee_ListView" runat="server">
                                                    <LayoutTemplate>
                                                        <table width="500">
                                                            <tr style="background-color: gray;">
                                                                <th>Bee Health</th>
                                                                <th>Bee Status</th>
                                                            </tr>
                                                            <tr id="itemPlaceholder" runat="server">
                                                            </tr>
                                                        </table>
                                                    </LayoutTemplate>
                                                    <ItemTemplate>
                                                        <tr runat="server">
                                                            <td>
                                                                <asp:Label ID="healthIDLabel" runat="server" Text='<%# Eval("health") %>' /></td>
                                                            <td>
                                                                <asp:Label ID="healthStatusIDLabel" runat="server" Text='<%# Eval("healthStatus") %>' /></td>
                                                            <td style="width: 80px">
                                                                <asp:Button Text="Damage" ID="WorkerBeeButton" CommandArgument='<%# Eval("index") %>'
                                                                    OnCommand="WorkerBeeCommand_Damage" runat="server" /></td>
                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:ListView>
                                            </h3>
                                        </td>
                                    </tr>
                                </table>

                            </asp:View>
                            <asp:View ID="View2" runat="server">
                                <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                                    <tr>
                                        <td>
                                            <h3>
                                                <asp:ListView ID="QueenBee_ListView" runat="server">
                                                    <LayoutTemplate>
                                                        <table width="500">
                                                            <tr style="background-color: gray;">
                                                                <th>Bee Health</th>
                                                                <th>Bee Status</th>
                                                            </tr>
                                                            <tr id="itemPlaceholder" runat="server">
                                                            </tr>
                                                        </table>
                                                    </LayoutTemplate>
                                                    <ItemTemplate>
                                                        <tr runat="server" id="listViewControlData">
                                                            <td>
                                                                <asp:Label ID="healthIDLabel" runat="server" Text='<%# Eval("health") %>' /></td>
                                                            <td>
                                                                <asp:Label ID="healthStatusIDLabel" runat="server" Text='<%# Eval("healthStatus") %>' /></td>
                                                            <td style="width: 80px">
                                                                <asp:Button Text="Damage" ID="WorkerBeeButton" CommandArgument='<%# Eval("index") %>'
                                                                    OnCommand="QueenBeeCommand_Damage" runat="server" /></td>

                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:ListView>
                                            </h3>
                                        </td>
                                    </tr>
                                </table>
                            </asp:View>
                            <asp:View ID="View3" runat="server">
                                <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                                    <tr>
                                        <td>
                                            <h3>
                                                <asp:ListView ID="DroneBee_ListView" runat="server">
                                                    <LayoutTemplate>
                                                        <table width="500">
                                                            <tr style="background-color: gray;">
                                                                <th>Bee Health</th>
                                                                <th>Bee Status</th>
                                                            </tr>
                                                            <tr id="itemPlaceholder" runat="server">
                                                            </tr>
                                                        </table>
                                                    </LayoutTemplate>
                                                    <ItemTemplate>
                                                        <tr runat="server" id="listViewControlData">
                                                            <td>
                                                                <asp:Label ID="healthIDLabel" runat="server" Text='<%# Eval("health") %>' /></td>
                                                            <td>
                                                                <asp:Label ID="healthStatusIDLabel" runat="server" Text='<%# Eval("healthStatus") %>' /></td>
                                                            <td style="width: 80px">
                                                                <asp:Button Text="Damage" ID="WorkerBeeButton" CommandArgument='<%# Eval("index") %>'
                                                                    OnCommand="DroneBeeCommand_Damage" runat="server" /></td>
                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:ListView>
                                            </h3>
                                        </td>
                                    </tr>
                                </table>
                            </asp:View>
                        </asp:MultiView>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
