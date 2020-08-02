using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Permissions;
using System.Web;
using System.Web.Configuration;

/// <summary>
/// Summary description for Product
/// </summary>
public class Product
{
    private int id;
    private string name;
    private decimal price;
    private string image;
    public string Image
    {
        get { return image; }
        set
        {
            image = value;
        }
    }
    public string OriginalImageName { get; set; }

    [NotMapped]
    public IFormFile ImageUpload { get; set; }

    public int Id
    {
        get { return id; }
        set
        {
            id = value;
        }
    }
    public string Name
    {
        get { return name; }
        set
        {
            name = value;
        }
    }
    public decimal Price
    {
        get { return price; }
        set
        {
            price = value;
        }
    }


    public Product()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    
    public static List<Product> fetchAllProducts()
    {
        List<Product> allProducts = new List<Product>();

        SqlConnection conn = new SqlConnection(); //objekat konekcije 
        conn.ConnectionString = WebConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;

        try {
            using (conn)
            {
                conn.Open();
                SqlCommand command = new SqlCommand("select id, name, price, image from dbo.Prodc where is_deleted = 0 ",conn);

                Product product = null;

                using(SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        product = new Product();

                        product.Id = Convert.ToInt32(reader["id"]);
                        product.Image = reader["Image"].ToString();
                        product.Name = reader["Name"].ToString();
                        product.Price = Convert.ToDecimal(reader["Price"]);

                        allProducts.Add(product);
                    }
                }
            }
        }
        catch(Exception)
        {

        }
        return allProducts;
    }

    [PrincipalPermission(SecurityAction.Demand, Role = "Admin")]
    public static int DeleteProductById(int productId)
    {
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = WebConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;

        int rows = 0;

        try
        {
            using (conn)
            {
                conn.Open();
                SqlCommand command = new SqlCommand("UPDATE Prodc SET is_deleted=1 WHERE id=@id", conn);

                SqlParameter myparam = new SqlParameter("@Id", System.Data.SqlDbType.Int, 11);
                myparam.Value = productId;

                command.Parameters.Add(myparam);
                rows = command.ExecuteNonQuery();
            }
        }
        catch(Exception err)
        {

        }
        return rows;
    }

    public static Product FetchProductById(int id)
    {
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = WebConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;

        Product product = null;

        try
        {
            using (conn)
            {
                conn.Open();
                SqlCommand command = new SqlCommand("SELECT Image, Name, Price FROM dbo.Prodc WHERE id =" +id, conn);

                using(SqlDataReader reader = command.ExecuteReader())
                {
                    reader.Read();

                    product = new Product();

                    product.Id = id;
                    product.Image = (string)reader["Image"];
                    product.Name = (string)reader["Name"];
                    product.Price = Convert.ToDecimal(reader["Price"]);
                }
            }
        }
        catch (Exception err)
        {

        }
        return product;
    }
    [PrincipalPermission(SecurityAction.Demand, Role = "Admin")]
    public int UpdateProduct()
    {
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = WebConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;

        int rows = 0;

        try
        {
            using (conn)
            {
                conn.Open();
                SqlCommand command = new SqlCommand("UPDATE dbo.Prodc SET Name=@Name, Price=@Price WHERE id=@id", conn);

                SqlParameter nameParam = new SqlParameter("@Name", System.Data.SqlDbType.NVarChar);
                nameParam.Value = Name;

                SqlParameter priceParam = new SqlParameter("@Price", System.Data.SqlDbType.Money);
                priceParam.Value = Price;

                SqlParameter myParam = new SqlParameter("@Id", System.Data.SqlDbType.Int);
                myParam.Value = Id;

                command.Parameters.Add(nameParam);
                command.Parameters.Add(priceParam);
                command.Parameters.Add(myParam);

                rows = command.ExecuteNonQuery();

            }
        }
        catch(Exception err)
        {

        }
        return rows;

    }
    [PrincipalPermission(SecurityAction.Demand,Role ="Admin")]
    public int InsertProduct()
    {
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = WebConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;

        int rows = 0;

        try
        {
            using (conn)
            {
                conn.Open();

                SqlCommand command = new SqlCommand("INSERT INTO dbo.Prodc(Image,Name, Price,is_deleted)" +
                    " VALUES (@Image, @Name,@Price,0)",conn);

                SqlParameter imgParam = new SqlParameter("@Image", System.Data.SqlDbType.NVarChar);
                imgParam.Value = Image;

                SqlParameter nameParam = new SqlParameter("@Name", System.Data.SqlDbType.NVarChar);
                nameParam.Value = Name;

                SqlParameter priceParam = new SqlParameter("@Price", System.Data.SqlDbType.Money);
                priceParam.Value = Price;

                command.Parameters.Add(imgParam);
                command.Parameters.Add(nameParam);
                command.Parameters.Add(priceParam);

                rows = command.ExecuteNonQuery();
            }
        }
        catch (Exception err) { }
        return rows;
    }

    

}