<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ASPDataSources.aspx.cs" Inherits="FirstASPNETWebApp.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div id="ADContent">

        <div style="width: 290px">
            ASP Data Source Example
        </div>
        <p style="width: 276px">
            Adventure Works
        </p>
        Select Country:<asp:DropDownList ID="DropDownList1" runat="server"
            AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource1"
            DataTextField="CountryRegion" DataValueField="CountryRegion">
            <asp:ListItem Value="" Text="Select a Country" />
        </asp:DropDownList>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:AdventureWorksConnectionString %>"
            SelectCommand="  SELECT  DISTINCT
	                                           [Address].CountryRegion
                                            FROM
	                                            [AdventureWorks].[SalesLT].[Customer] AS Customer
                                            INNER JOIN
                                                [AdventureWorks].[SalesLT].[CustomerAddress] AS CustomerAddress ON CustomerAddress.CustomerID = Customer.CustomerID
                                            INNER JOIN 
	                                            [AdventureWorks].[SalesLT].[Address] AS [Address] ON CustomerAddress.AddressID = [Address].AddressID
                                            ORDER BY
	                                            [Address].CountryRegion"></asp:SqlDataSource>
        <br />
        <asp:GridView ID="CustomerbyCountryGridView" runat="server"
            DataSourceID="CustomersSqlDataSource" Height="122px" Width="381px" AutoGenerateColumns="False" DataKeyNames="CustomerID" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="CountryRegion" HeaderText="CountryRegion" SortExpression="CountryRegion" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="CustomersSqlDataSource" runat="server"
            ConnectionString="<%$ ConnectionStrings:AdventureWorksConnectionString %>"
            SelectCommand="  SELECT  DISTINCT
	                                           Customer.CustomerID,
                                                Customer.FirstName,
                                                Customer.LastName,
                                                [Address].CountryRegion
                                            FROM
	                                            [AdventureWorks].[SalesLT].[Customer] AS Customer
                                            INNER JOIN
                                                [AdventureWorks].[SalesLT].[CustomerAddress] AS CustomerAddress ON CustomerAddress.CustomerID = Customer.CustomerID
                                            INNER JOIN 
	                                            [AdventureWorks].[SalesLT].[Address] AS [Address] ON CustomerAddress.AddressID = [Address].AddressID
                                            WHERE
                                                [Address].CountryRegion=@SelectedCountry
                                            ORDER BY
	                                            [Address].CountryRegion, Customer.CustomerID">
            <SelectParameters>
                <asp:ControlParameter Name="SelectedCountry" ControlID="DropDownList1" DefaultValue="NULL" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <p>
            <asp:DetailsView ID="DetailsView1" runat="server" DataKeyNames="CustomerID"
                DataSourceID="CustomerSqlDataSource" Height="50px" Width="125px">
                <Fields>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="CustomerSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:AdventureWorksConnectionString %>"
                SelectCommand="SELECT
                    * 
                FROM
                   [AdventureWorks].[SalesLT].[Customer] AS Customer
                WHERE 
                 (Customer.CustomerID = @CustomerID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="CustomerbyCountryGridView" DefaultValue="0" Name="CustomerID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
    </div>
</asp:Content>
