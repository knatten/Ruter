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
		public List<Departure> Departures {get; set;}
		private readonly RealtimeDataSource _dataSource;

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
	}
}