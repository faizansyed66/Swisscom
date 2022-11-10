using sqlapp.Models;
using System.Data.SqlClient;
using System.Text.Json;

namespace sqlapp.Services
{

    // This service will interact with our Product data in the SQL database
    public class ProductService : IProductService
    {

        public async Task <List<Product>> GetProducts()
        {
            String FunctionURL = "https://rest.azurewebsites.net/api/GetProducts?code=VnWYeYzw0zv9N-m1EQkWubpJHfFjp5uiugHIzTPkoU_4AzFuIowcdw==";

            using (HttpClient _client = new HttpClient())
            {
                HttpResponseMessage _response = await _client.GetAsync(FunctionURL);
                string _content = await _response.Content.ReadAsStringAsync();
                return JsonSerializer.Deserialize<List<Product>>(_content);
            }

            }
    }
}

