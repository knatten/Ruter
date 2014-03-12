using Uno;
using Uno.Collections;
using Uno.Graphics;
using Uno.Scenes;
using Uno.Content;
using Uno.Content.Models;
using Experimental.Net.Http;
using Experimental.Data;

namespace RuterTest
{
	public class RealtimeDataSource : IDataSource
	{
		private CheckedWatch _checkedWatch;

		public RealtimeDataSource(CheckedWatch checkedWatch)
		{
			_checkedWatch = checkedWatch;
		}

		private void OnError(string error)
		{
			debug_log error;
		}

		public void Update()
		{
			HttpClient httpClient = new HttpClient();
			var tmpWatch = _checkedWatch.Watch;
			var tmpStop = tmpWatch.Stop;
			var tmpId = tmpStop.StopId;
            var query = "http://reis.ruter.no/reisrest/realtime/getrealtimedata/" + tmpId;
			httpClient.GetStringAsync(query, Callback);
		}

		private void Callback(string content)
		{
			var departures = Parser.Parse(content);
			_checkedWatch.Departures = departures;
		}
	}
}