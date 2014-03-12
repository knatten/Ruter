using Uno;
using Uno.Collections;
using Uno.Graphics;
using Uno.Scenes;
using Uno.Content;
using Uno.Content.Models;

namespace RuterTest
{
	public class MockDataSource : IDataSource
	{
		private readonly CheckedWatch _checkedWatch;

		public MockDataSource(CheckedWatch checkedWatch)
		{
			_checkedWatch = checkedWatch;
		}

		public void Update()
		{
			var tmpWatch = _checkedWatch.Watch;
			var tmpStop = tmpWatch.Stop;
			var data = MockData.Data[tmpStop.StopId];
			var departures = Parser.Parse(data);
			_checkedWatch.Departures = departures;
		}
	}
}