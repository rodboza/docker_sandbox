using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;

using dbmq.Data;
using dbmq.Models;
using Microsoft.EntityFrameworkCore;

namespace dbmq
{
    public class Program
    {
        public static void Main(string[] args)
        {
            BuildWebHost(args).Run();
            StartSubscriber();
        }

        public static IWebHost BuildWebHost(string[] args) =>
            WebHost.CreateDefaultBuilder(args)
                .UseStartup<Startup>()
                .Build();


        static SimpleTopicSubscriber subscriber;

        public static void StartSubscriber()
        {
            string TOPIC_NAME = "PersonsTopic";
            string BROKER = "tcp://activemq:61616";
            string CLIENT_ID = "ActiveMqFirstSubscriber";
            string CONSUMER_ID = "ActiveMqFirstSubscriber";

            subscriber = new SimpleTopicSubscriber(TOPIC_NAME, BROKER, CLIENT_ID, CONSUMER_ID);
            subscriber.OnMessageReceived += new MessageReceivedDelegate(subscriber_OnMessageReceived);

            /*
            using (SimpleTopicSubscriber subscriber = new SimpleTopicSubscriber(TOPIC_NAME, BROKER, CLIENT_ID, CONSUMER_ID))
            {
                subscriber.OnMessageReceived += new MessageReceivedDelegate(subscriber_OnMessageReceived);
            }
            */
        }

        static void subscriber_OnMessageReceived(string message)
        {
            Console.WriteLine(message);

            try
            {
                using (var contexto = new Contexto())
                {
                    var msg = new Msg(message);
                    contexto.Add(msg);
                    contexto.SaveChanges();
                }
            }
            catch (Exception e)
            {
                Console.Write("Erro:");
                Console.WriteLine(e);
            }

        }
    }

}

