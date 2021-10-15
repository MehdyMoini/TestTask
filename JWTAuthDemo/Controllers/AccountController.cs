using Dapper;
using TestTask.Models;
using TestTask.Repository;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace TestTask.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    
    public class AccountController : ControllerBase
    {
        private readonly IJWTAuthManager _authentication;

        public AccountController(IJWTAuthManager authentication)
        {
            _authentication = authentication;
        }

        [HttpPost("Login")]
        [AllowAnonymous]
        public IActionResult login([FromBody]LoginModel user)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest("Parameter is missing");
            }

            DynamicParameters dp_param = new DynamicParameters();
            dp_param.Add("username",user.username,DbType.String);
            dp_param.Add("password",user.password,DbType.String);
            dp_param.Add("retVal", DbType.String, direction: ParameterDirection.Output);
            var result = _authentication.Execute_Command<User>("sp_loginUser",dp_param);
            if (result.code == 200)
            {
                var token = _authentication.GenerateJWT(result.Data);
                return Ok(token);
            }
            return NotFound(result.Data);
        }

    

        [HttpPost("Register")]
        
        public IActionResult Register([FromBody]User user)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest("Parameter is missing");
            }

            DynamicParameters dp_param = new DynamicParameters();
            dp_param.Add("lname", user.lname, DbType.String);
            dp_param.Add("username", user.Username, DbType.String);
            dp_param.Add("password", user.Password, DbType.String);
            dp_param.Add("fname", user.fname, DbType.String);
            dp_param.Add("retVal", DbType.String, direction: ParameterDirection.Output);
            var result = _authentication.Execute_Command<User>("sp_registerUser", dp_param);
            if (result.code == 200)
            {
                return Ok(result);
            }
            
           
            return BadRequest(result);
        }

      
    }
}
