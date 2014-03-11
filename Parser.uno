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
				var departureString = json[i]["ExpectedDepartureTime"].AsString();
				var departure = TimePoint.FromUnix(
					int.Parse(departureString.Substring(6,10)),
					int.Parse(departureString.Substring(20,4))
				);
				var lineName = json[i]["PublishedLineName"].AsString();
				var destination = json[i]["DestinationDisplay"].AsString();
				departures.Add(new Departure(departure, lineName, destination));
			}
			return departures;
		}
	}
}