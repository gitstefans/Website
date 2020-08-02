using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Permissions;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;


public partial class Products : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        loadAllData();
    }
    public void loadAllData()
        {
        List<Product> products = Product.fetchAllProducts();

        foreach(Product product in products)
        {
            HtmlGenericControl singleProductContainer = new HtmlGenericControl();
            //u koji element ce se ovakav objekat renderovati
            singleProductContainer.TagName = "div";
            singleProductContainer.Attributes["class"] = "singleProductContainer";
            
            

            Image prodImg = new Image();
            prodImg.ImageUrl = "~/img2/" + product.Image;
            
            HtmlGenericControl infoProductContainer = new HtmlGenericControl();
            infoProductContainer.TagName = "div";
            infoProductContainer.Attributes["class"] = "infoProductContainer";
           
            

            Label name = new Label();
            name.CssClass = "productName";
            name.Text = product.Name;

            Label price = new Label();
            price.CssClass = "productPrice";
            
            price.Text =" "+ product.Price.ToString()+" Euro";

           

            HtmlGenericControl breakcontainer = new HtmlGenericControl("br");
           


            LinkButton editButton = new LinkButton();
            editButton.ID = "editLink" + product.Id;
            editButton.Text = "Edit";
            editButton.Attributes["style"] = "margin-right:5px";
            editButton.PostBackUrl = "EditingProducts.aspx?mode=edit&id=" + product.Id;
            //editButton.Click += EditButton_Click;
            editButton.Visible = User.IsInRole("Admin");

            ButtonNew.ID = "newLink";
            ButtonNew.PostBackUrl = "EditingProducts.aspx?mode=new";
            ButtonNew.Visible = User.IsInRole("Admin");

            

            LinkButton deleteButton = new LinkButton();
            deleteButton.ID = "deleteLink" + product.Id;
            deleteButton.Text = "Delete";
            deleteButton.CommandArgument = product.Id.ToString();
            deleteButton.Click += DeleteButton_Click;
            deleteButton.Visible = User.IsInRole("Admin");

            
            

            singleProductContainer.Controls.Add(prodImg);

            infoProductContainer.Controls.Add(name);
            infoProductContainer.Controls.Add(price);
            infoProductContainer.Controls.Add(editButton);
            infoProductContainer.Controls.Add(deleteButton);

            singleProductContainer.Controls.Add(infoProductContainer);
         
            ProductContainer.Controls.Add(singleProductContainer);
            ProductContainer.Controls.Add(breakcontainer);
            //kod za prikaz proizvoda na stranici
        }
    }
    [PrincipalPermission(SecurityAction.Demand, Role = "Admin")]
    private void ButtonNew_Click(object sender, EventArgs e)
    {
        
        Response.Redirect("");
    }

   
    [PrincipalPermission(SecurityAction.Demand,Role ="Admin")]
    private void DeleteButton_Click(object sender, EventArgs e)
    {
        LinkButton source = (LinkButton)sender; //izvorna kontrola sadrzana u senderu

        int rows = Product.DeleteProductById(Convert.ToInt32(source.CommandArgument)); //CA je id osobe za brisanje

        if(rows == 1)
        {
            ProductContainer.Controls.Clear(); //uklanjamo sve stavke iz panela
            loadAllData();
        }

    }
    
}