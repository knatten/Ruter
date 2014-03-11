using Uno;
using Uno.Collections;
using Uno.Graphics;
using Uno.Scenes;
using Uno.Scenes.Primitives;
using Uno.Content;
using Uno.Content.Models;
using Experimental.Net.Http;
using Experimental.Data;

namespace RuterTest
{
	public class App : Uno.Application
	{
		CurrentData data = new CurrentData();
		
		public override void Update()
		{
			data.Update();
		}
	}
	
    public partial class TestSetup// : Uno.Application
    {
		public TestSetup()
		{
			var httpClient = new HttpClient();
            var query = "http://reis.ruter.no/reisrest/realtime/getrealtimedata/2310310?callback";
            //httpClient.GetStringAsync(query, Callback);
			SetupTestRunner();
		}

		private void Callback(string content)
		{
			debug_log DateTime.Now;
			var json = JsonReader.Parse(content);
			debug_log json;
		}
    }
}