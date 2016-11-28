<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ASPControls.aspx.cs" Inherits="FirstASPNETWebApp.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div id="ACContent">
        <h2>FirstASPNETWebApp: ASP Control Training Page</h2>
        <div class="textBox" style="font-weight: 700">
            <h3>ASP:Text Box</h3>
            <h4>Tell us a little bit about yourself</h4>
            <label id="NameLabel" class="NameClass">Name</label>
            <asp:TextBox ID="NameTextBox" runat="server" Width="189px" >First Name , Surename</asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="rfvName" ControlToValidate="NameTextBox" ErrorMessage="Name Required." Display="Dynamic" />
            <br/>
            <label id="EmailLabel" class="EMailClass">Email</label>
            <asp:TextBox ID="EmailTextBox" runat="server" Width="194px" >e.g. bobhope@hollywood.com</asp:TextBox>
            <asp:RegularExpressionValidator runat="server" ID="revEmail" ControlToValidate="EmailTextBox" ErrorMessage="Valid email address is required" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$" Display="Dynamic" />
            <asp:RequiredFieldValidator runat="server" ID="rfvEmail" ControlToValidate="EmailTextBox" ErrorMessage="Required." Display="Dynamic" />
            <br />
        </div>
        <div class="dropDownList">
            <h3>ASP:Drop Down List</h3>
            <label>Your Favorite Colour:</label>
            <asp:DropDownList ID="ColourDropDownList" runat="server" Height="16px" Width="213px">
                <asp:ListItem Text="Please Choose A Colour" Value="" />
                <asp:ListItem Text="Red" Value="Red" />
                <asp:ListItem Text="Orange" Value="Orange" />
                <asp:ListItem Text="Yellow" Value="Yellow" />
                <asp:ListItem Text="Green" Value="Green" />
                <asp:ListItem Text="Blue" Value="Blue" />
                <asp:ListItem Text="Indigo" Value="Indigo" />
                <asp:ListItem Text="Violet" Value="Violet" />
            </asp:DropDownList>
            <asp:RequiredFieldValidator runat="server" ID="rfvColour" ControlToValidate="ColourDropDownList" ErrorMessage="Colour Required." Display="Dynamic" />
            <br />
        </div>
        <div class="button" style="font-weight: 700">
            <h3>ASP:Button</h3>
            <asp:Button ID="btnSubmit" runat="server" Text="Submit Info" OnClick="btnSubmit_Click" />
            <br />
            <h3>ASP:Calendar</h3>
            <br />
            <asp:Literal ID="Birthday" runat="server" Text="Birthday"></asp:Literal>
            :<br />
            <asp:TextBox ID="BirthdayTextBox" runat="server" OnTextChanged="BirthdayTextBox_TextChanged" Width="177px"></asp:TextBox>
            <asp:ImageButton ID="BirthdayCalendarImage" runat="server" Height="97px" ImageUrl="~/Images/calendar-300x300.png" OnClick="BirthdayCalendarImage_Click" Width="88px" />
            <br />
            <asp:RegularExpressionValidator ID="BirthdayRegularExpressionValidator" runat="server" ControlToValidate="BirthdayTextBox" ErrorMessage="Error: Date (e.g. 1 April 1960) Required." ValidationExpression="^(([0-9])|([0-2][0-9])|([3][0-1]))\-(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)\-\d{4}$">Error: Date (e.g. 1 April 1960) Required.</asp:RegularExpressionValidator>
            <br />
            <br />
            <asp:Literal ID="BirthdayYear" Text="Year:" runat="server"></asp:Literal>
            <asp:DropDownList ID="ddxBirthdayYears"  runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddxBirthdayYears_SelectedIndexChanged" >
            </asp:DropDownList>
            <asp:Literal ID="BirthdayMonth" Text="Month:" runat="server"></asp:Literal>
            <asp:DropDownList ID="ddxBirthdayMonths"  runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddxBirthdayMonths_SelectedIndexChanged" >
            </asp:DropDownList>
            <br />
            <asp:Calendar ID="BirthdayCalendar" runat="server" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" OnSelectionChanged="BirthdayCalendar_SelectionChanged"  Width="400px" Caption="Select Your Birthday" CaptionAlign="Top" FirstDayOfWeek="Sunday">
                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                <DayStyle Width="14%" />
                <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                <TodayDayStyle BackColor="#CCCC99" />
            </asp:Calendar>
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

