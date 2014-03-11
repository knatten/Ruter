using Uno;
using Uno.Collections;
using Uno.Graphics;
using Uno.Scenes;
using Uno.Content;
using Uno.Content.Models;

namespace RuterTest
{
	public class CheckedWatch
	{
		public readonly Watch Watch;
		public List<Departure> Departures {get; private set;}
		private RealtimeDataSource _dataSource;
		
		public CheckedWatch(Watch watch)
		{
			Watch = watch;
			Departures = new List<Departure>();
			_dataSource = new RealtimeDataSource(this);
		}
		
		public void Update()
		{
			_dataSource.Update();
		}
		
		public void SetDepartures(List<Departure> departures)
		{
			var tmpWatch = Watch;
			var tmpStop = tmpWatch.Stop;
			debug_log "Setting departures for " + tmpStop.Name;
			Departures = departures;
			foreach (var dep in Departures)
			{
				debug_log dep.ExpectedDeparture.ToString() + " " + dep.LineName;
			}
		}
	}
}