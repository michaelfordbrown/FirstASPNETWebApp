using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace FirstASPNETWebApp
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                BirthdayCalendar.Visible = false;

                ddxBirthdayYears.Visible = false;
                ddxBirthdayMonths.Visible = false;

                BirthdayYear.Visible = false;
                BirthdayMonth.Visible = false;

                Read_XML_Colours_File();

                Read_XML_BirthdayYears_File();
                Read_XML_BirthdayMonths_File();
            }
        }

        protected void Read_XML_BirthdayYears_File()
        {
            DataSet DSBirthdayYears = new DataSet();
            DSBirthdayYears.ReadXml(Server.MapPath("App_Data\\BirthdayYears.xml"));

            ddxBirthdayYears.DataTextField = "Year";
            ddxBirthdayYears.DataValueField = "YearId";
            ddxBirthdayYears.DataSource = DSBirthdayYears;
            ddxBirthdayYears.DataBind();           

        }

        protected void Read_XML_BirthdayMonths_File()
        {
            DataSet DSBirthdayMonths = new DataSet();
            DSBirthdayMonths.ReadXml(Server.MapPath("App_Data\\BirthdayMonths.xml"));

            ddxBirthdayMonths.DataTextField = "MonthName";
            ddxBirthdayMonths.DataValueField = "MonthId";
            ddxBirthdayMonths.DataSource = DSBirthdayMonths;
            ddxBirthdayMonths.DataBind();

        }
        protected void Read_XML_Colours_File()
        {
            DataSet DSColours = new DataSet();
            DSColours.ReadXml(Server.MapPath("App_Data\\Colours.xml"));

            ddxColours.DataTextField = "ColourName";
            ddxColours.DataValueField = "ColourId";
            ddxColours.DataSource = DSColours;
            ddxColours.DataBind();

            ListItem liSelectColour = new ListItem("Select Colour", "-1");
            ddxColours.Items.Insert(0, liSelectColour);
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string message = string.Format("<span style=color:{0};>You said your name is {1}, your email address is {2} and your favourite colour is {3}.</span>",
               ColourDropDownList.Text, NameTextBox.Text, EmailTextBox.Text, ColourDropDownList.SelectedValue);
            ltMessage1.Text = message;
        }
        protected void btnSubmit_Colour(object sender, EventArgs e)
        {
            string message = string.Format("<span style=color:{0};>Colour Choosen is {0}.</span>",
               ddxColours.SelectedItem.ToString());
            liMessageXML1.Text = message;
        }

        protected void SelectColourButton_Click(object sender, EventArgs e)
        {
            SqlConnection colourConnection = new SqlConnection("Server=tcp:geminiserver.database.windows.net,1433;Initial Catalog=mfbColours;Persist Security Info=False;User ID=mike;Password=Metroe113llk;MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            SqlCommand colourCommand = new SqlCommand("SELECT ColourName FROM Colours ORDER BY ColourName", colourConnection);

            try
            {
                // if (SelectColourButton.Text.CompareTo("Display and Sort Colours") == 0)
                {
                    colourConnection.Open();
                    SqlDataReader reader = colourCommand.ExecuteReader();
                    while (reader.Read())
                    {
                        lbColour.Items.Add(reader["ColourName"].ToString());
                        //Response.Write("Azure Colour = "+ reader["ColourName"].ToString() +"<br />");
                    }
                    reader.Close();

                    // SelectColourButton.Text = "Choose Colour";
                }

                string message = "Colour Choosen: ";
                if (lbColour.SelectedItem != null)
                {
                    foreach (ListItem li in lbColour.Items)
                    {
                        if (li.Selected)
                        {
                            int intCR = li.Text.CompareTo("White ");

                            if (intCR == 1)
                            {
                                message += string.Format("<span style=color:Black;> White</span><br/>");
                            }
                            else
                            {
                                message += string.Format("<span style=color:{0};> {0}</span><br/>", li.Text);
                            }

                        }
                    }
                    ltMessageGV1.Text = message;
                }
            }
            catch (SqlException ex)
            {
                Response.Write("Select Colour Exception: " + ex.ToString());
                throw;
            }
            finally
            {
                colourConnection.Close();
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnSelectColours_Click(object sender, EventArgs e)
        {
            string message = "Colour Choosen:<br/>";
            if (ddxColours.SelectedItem != null)
            {
                foreach (ListItem li in ddxColours.Items)
                {
                    if (li.Selected)
                    {
                        message += string.Format("<span style=color:{0};> {0}</span><br/>", li.Text);
                    }
                }
                liMessageXML1.Text = message;
            }
        }

        protected void BirthdayCalendar_SelectionChanged(object sender, EventArgs e)
        {
            BirthdayTextBox.Text = BirthdayCalendar.SelectedDate.ToLongDateString();

            BirthdayCalendar.Visible = false;
            BirthdayCalendarImage.Visible = true;

            ddxBirthdayYears.Visible = false;
            ddxBirthdayMonths.Visible = false;

            BirthdayYear.Visible = false;
            BirthdayMonth.Visible = false;
        }

        protected void BirthdayCalendarImage_Click(object sender, ImageClickEventArgs e)
        {
            BirthdayCalendarImage.Visible = false;
            BirthdayCalendar.Visible = true;

            ddxBirthdayYears.Visible = true;
            ddxBirthdayMonths.Visible = true;

            BirthdayYear.Visible = true;
            BirthdayMonth.Visible = true;
        }

        protected void BirthdayTextBox_TextChanged(object sender, EventArgs e)
        {
            BirthdayCalendar.SelectedDate = Convert.ToDateTime(BirthdayTextBox.Text);
        }

        protected void ddxBirthdayYears_SelectedIndexChanged(object sender, EventArgs e)
        {
            int year = Convert.ToInt16(ddxBirthdayYears.SelectedValue);
            int month = Convert.ToInt16(ddxBirthdayMonths.SelectedValue);

            BirthdayCalendar.VisibleDate = new DateTime(year, month, 01);
        }
        protected void ddxBirthdayMonths_SelectedIndexChanged(object sender, EventArgs e)
        {
            int year = Convert.ToInt16(ddxBirthdayYears.SelectedValue);
            int month = Convert.ToInt16(ddxBirthdayMonths.SelectedValue);

            BirthdayCalendar.VisibleDate = new DateTime(year, month, 01);
            BirthdayCalendar.SelectedDate = new DateTime(year, month, 01);

        }

        /*
 protected void btnGetData_Click(object sender, EventArgs e)
 {

 } */
    }
}