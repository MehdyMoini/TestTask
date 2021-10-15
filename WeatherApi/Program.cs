using System;
using TestTask.ModelsAndServices;

namespace WeatherApi
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            var t = RabbitHutch.CreateBus("Localhost");
            while ( 1 == 1)
            {
               var g =  t.ReceiveAsync<string>("myQuey", x =>
                {
                    Console.WriteLine(x);
                });
            }
            
        }
    }
}
