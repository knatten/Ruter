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
		public event Action Changed;

		private readonly IDataSource _dataSource;

		public CheckedWatch(Watch watch)
		{
			Watch = watch;
			Departures = new List<Departure>();
			_dataSource = DataSourceFactory.Create(this);
		}

		public void Update()
		{
			_dataSource.Update();
		}

		public void OfferDepartures(List<Departure> departures)
		{
			Departures.Clear();
			var tmpDepartures = new List<Departure>();
			foreach (var departure in departures)
			{
				tmpDepartures.Add(departure);
			}
			foreach (var departure in tmpDepartures)
			{
				var tmpWatch = Watch;
				var acceptedLines = tmpWatch.LineNames;
				if (acceptedLines.Contains(departure.LineName))
					Departures.Add(departure);
			}
			if (Changed != null)
				Changed();
		}
	}
}