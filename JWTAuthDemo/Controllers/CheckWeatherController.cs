using Dapper;
using Hangfire;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using TestTask.Models;
using TestTask.Repository;

namespace TestTask.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CheckWeatherController : Controller
    {

        private readonly IBus _busControl;

        private readonly IJWTAuthManager _authentication;

        public CheckWeatherController(IJWTAuthManager authentication,IBus busControl)
        {
            _authentication = authentication;
            _busControl = busControl;
        }
        
        [Authorize]
        [HttpGet("Index")]
        public void Index()
        {
            float temp;
            string apiResponse;
            using (var httpClient = new HttpClient())
            {
                using (var response = httpClient.GetAsync("https://openweathermap.org/data/2.5/onecall?lat=51.5085&lon=-0.1257&units=metric&appid=439d4b804bc8187953eb36d2a8c26a02"))
                {
                    apiResponse = response.Result.Content.ReadAsStringAsync().Result;

                    temp = float.Parse(apiResponse.Substring(apiResponse.IndexOf("temp") + 6, 5));


                }
            }
            if (temp > 14)
            {
                DynamicParameters dp_param = new DynamicParameters();
                dp_param.Add("city", "London", DbType.String);
                dp_param.Add("temp", temp, DbType.Int32);
                dp_param.Add("date", DateTime.Now, DbType.DateTime);

                using (IDbConnection dbConnection = new SqlConnection("Server=localhost;Database=TestTask;User Id=sa;Password=12345678;"))
                {
                    if (dbConnection.State == ConnectionState.Closed)
                        dbConnection.Open();
                     dbConnection.Query<TemperatureLog>("sp_logTemperature", dp_param, commandType: CommandType.StoredProcedure).FirstOrDefault();
             
                }
            }
            BackgroundJob.Schedule(() =>  _busControl.SendAsync("MyQueue", apiResponse), TimeSpan.FromSeconds(30));
        }
    }
}
