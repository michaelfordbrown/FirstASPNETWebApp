<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ASPControls.aspx.cs" Inherits="FirstASPNETWebApp.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div id="ACContent">
        <h2>ASP Control Training Page</h2>
        <div class="textBox">
            <h3>ASP:Text Box</h3>
            <h4>Tell us a little bit about yourself</h4>
            <label>Name</label>
            <asp:TextBox ID="txtName" runat="server" />
            <asp:RequiredFieldValidator runat="server" ID="rfvName" ControlToValidate="txtName" ErrorMessage="Required." Display="Dynamic" />
            <br />
            <label>Email</label>
            <asp:TextBox ID="txtEmail" runat="server" />
            <asp:RegularExpressionValidator runat="server" ID="revEmail" ControlToValidate="txtEmail" ErrorMessage="Valid email address is required" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$" Display="Dynamic" />
            <asp:RequiredFieldValidator runat="server" ID="rfvEmail" ControlToValidate="txtEmail" ErrorMessage="Required." Display="Dynamic" />
            <br />
        </div>
        <div class="dropDownList">
            <h3>ASP:Drop Down List</h3>
            <label>Your Favorite Colour:</label>
            <asp:DropDownList ID="ddlColour" runat="server">
                <asp:ListItem Text="Please Choose A Colour" Value="" />
                <asp:ListItem Text="Red" Value="Red" />
                <asp:ListItem Text="Orange" Value="Orange" />
                <asp:ListItem Text="Yellow" Value="Yellow" />
                <asp:ListItem Text="Green" Value="Green" />
                <asp:ListItem Text="Blue" Value="Blue" />
                <asp:ListItem Text="Indigo" Value="Indigo" />
                <asp:ListItem Text="Violet" Value="Violet" />
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="rfvColour" ControlToValidate="ddlColour" ErrorMessage="Colour Required." Display="Dynamic" />
            <br />
        </div>
        <div class="button">
            <h3>ASP:Button</h3>
            <asp:Button ID="btnSubmit" runat="server" Text="Submit Info" OnClick="btnSubmit_Click" />
            <br />
        </div>
        <div class="literal">
            <h3>ASP:Literal</h3>
            <asp:Literal ID="ltMessage1" runat="server" />
            <br />
        </div>
        <div class="xMLFile">
            <h3>ASP: XML File</h3>
            <asp:DropDownList ID="ddxColours" runat="server">
            </asp:DropDownList>
            <br />
            <h4>Colour Choosen From XML List: </h4>
            <asp:Button ID="btnXMLColour" runat="server" Text="Submit Colour" OnClick="btnSubmit_Colour" />
            <br />
            <asp:Literal ID="liMessageXML1" runat="server" />
            <br />
        </div>
        <div class="sqlDataSource">
            <h3>ASP SQL Data Source</h3>
            <p>Setup connection to the Azure Colours database.</p>
            <asp:SqlDataSource ID="SqlDataSourceAzure" runat="server"
                ConnectionString="<%$ ConnectionStrings:AzureColoursConnectionString %>"
                SelectCommand="SELECT * FROM Colours"></asp:SqlDataSource>
            <br />
        </div>
        <div class="gridView">
            <h3>ASP:Grid View (Using the Azure Database)</h3>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSourceAzure">
            </asp:GridView>
            <br />
            <asp:ListBox ID="lbColour" runat="server"></asp:ListBox>
            <br />
            <asp:Button ID="SelectColourButton" runat="server" OnClick="SelectColourButton_Click" Text="Display and Sort Colours" />
            <br />
            <h4>Selected Colour From Grid View: </h4>
            <asp:Literal ID="ltMessageGV1" runat="server" />
            <br />
          </div>
    </div>

    <script type="text/javascript">
        function changeColour() {
            var div = document.getElementById("ACContent");
            div.textContent = "Change Colour Called! Changing to: ";
            var text = div.textContent;

            ACContent.style.color = "red";
        }
    </script>
</asp:Content>

