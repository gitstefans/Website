using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditingProducts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (IsPostBack)
            return;

        if (Request.QueryString["mode"] == null)
            return;
        if (Request.QueryString["mode"].Equals("new"))
        {   
            PageHeading.InnerText = "New Product";
        }
        else if(Request.QueryString["mode"].Equals("edit"))
        {
            PageHeading.InnerText = "Edit Product";

            if(Request.QueryString["id"] != null)
            {
                Product product = Product.FetchProductById(Convert.ToInt32(Request.QueryString["id"]));

                NameLabel.Text = product.Name;
                PriceLabel.Text = product.Price.ToString();

                IdHiddenField.Value = Request.QueryString["id"];
            }
        }
        
    }

    protected void SaveButton_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["mode"].Equals("edit"))
        {
            Product product = new Product();
            
            product.Name = TextBox1.Text;
            product.Price = Convert.ToDecimal(TextBox2.Text);
            product.Id = Convert.ToInt32(IdHiddenField.Value);
            int rows = product.UpdateProduct();
            
            if (rows == 1)
            {
                Response.Redirect("Products.aspx");
            }
        }
        else if (Request.QueryString["mode"].Equals("new"))
        {
            Product product = new Product();

            
            
            

            if(FileUpload1.PostedFile != null && FileUpload1.FileName != "")
            {
                FileUpload1.SaveAs(Server.MapPath("~/img2/"+ FileUpload1.FileName));
                lblMessage.Text = "Image Uploaded";
                lblMessage.ForeColor = System.Drawing.Color.Green;
               
            }
            else
            {
                lblMessage.Text = "Upload Failed";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
            product.Image = FileUpload1.FileName;
            
            product.Name = TextBox1.Text;
            product.Price = Convert.ToDecimal(TextBox2.Text); 

            int rows = product.InsertProduct();
            

            if (rows == 1)
            {
                Response.Redirect("Products.aspx");
            }
        }
    }

    private void EditingProducts_SaveStateComplete(object sender, EventArgs e)
    {
        throw new NotImplementedException();
    }
}