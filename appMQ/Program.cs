using System;

namespace appMQ
{
    class Program
    {
        static void Main(string[] args)
        {

string TOPIC_NAME = "PersonsTopic";
//string BROKER = "tcp://activemq:61616";
string BROKER = "tcp://localhost:61616";
SimpleTopicPublisher publisher;
publisher = new SimpleTopicPublisher(TOPIC_NAME, BROKER);
publisher.SendMessage(@"{Id:111,FirtName:Rodrigo,MiddleName:M,LastName:Barboza}");
publisher.SendMessage(@"{Id:222,FirtName:Rodrigo,MiddleName:M,LastName:Barboza}");
publisher.SendMessage(@"{Id:333,FirtName:Rodrigo,MiddleName:M,LastName:Barboza}");
publisher.Dispose();

            Console.WriteLine("Mensagem Enviada!");

string CLIENT_ID = "ActiveMqFirstSubscriber";
string CONSUMER_ID = "ActiveMqFirstSubscriber";

using (SimpleTopicSubscriber subscriber = new SimpleTopicSubscriber(TOPIC_NAME, BROKER, CLIENT_ID, CONSUMER_ID))
{
subscriber.OnMessageReceived += new MessageReceivedDelegate(subscriber_OnMessageReceived);
Console.WriteLine("Press any key to exit...");
Console.ReadKey();
}



        }

static void subscriber_OnMessageReceived(string message)
{
Console.WriteLine(message);
}

    }
}
