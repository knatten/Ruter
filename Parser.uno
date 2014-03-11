using Uno;
using Uno.Collections;
using Uno.Graphics;
using Uno.Scenes;
using Uno.Content;
using Uno.Content.Models;
using Experimental.Data;

namespace RuterTest
{


	public static class Parser
	{
		public static List<Departure> Parse(string jsonContent)
		{
			var json = JsonReader.Parse(jsonContent);
			var departures = new List<Departure>();
			for (int i = 0 ; i < 30; ++i)
			{
				if (json[i].JsonDataType != JsonDataType.Object)
					break;
				var departure = int.Parse(json[i]["ExpectedDepartureTime"].AsString().Substring(6,10));
				var lineName = json[i]["PublishedLineName"].AsString();
				departures.Add(new Departure(departure, lineName));
			}
			return departures;
		}
	}
}