using Uno;
using Uno.Collections;
using Uno.Graphics;
using Uno.Scenes;
using Uno.Content;
using Uno.Content.Models;

namespace RuterTest
{
	public class CurrentData
	{
		public List<CheckedWatch> CheckedWatches { get; private set;}
		private int _lastUpdate = 0;
		private static readonly int _updateInterval = 30;
		
		public CurrentData()
		{
			CheckedWatches = new List<CheckedWatch>();
		}
		
		public void Update()
		{
			var now = DateTime.Now.Hour * 60 * 60 + DateTime.Now.Minute * 60 + DateTime.Now.Second;
			if (_lastUpdate + _updateInterval > now)
				return;			
			_lastUpdate = now;
			RemoveInactiveWatches();
			AddActiveWatches();
			foreach (var checkedWatch in CheckedWatches)
			{
				checkedWatch.Update();
			}
			debug_log CheckedWatches.Count;
		}
		
		private void RemoveInactiveWatches()
		{
			var removing = new List<CheckedWatch>();
			foreach (var checkedWatch in CheckedWatches)
			{
				var tmpWatch = checkedWatch.Watch;
				if (!tmpWatch.Active)
				{
					removing.Add(checkedWatch);
				}
			}
			foreach (var checkedWatch in removing)
			{
				CheckedWatches.Remove(checkedWatch);
			}
		}
		
		private void AddActiveWatches()
		{
			foreach (var watch in Configuration.ActiveWatches)
			{
				AddWatchIfIsntThere(watch);
			}
		}
		
		private void AddWatchIfIsntThere(Watch watch)
		{
			foreach (var checkedWatch in CheckedWatches)
			{
				var tmpWatch = checkedWatch.Watch;
				if (tmpWatch.Equals(watch))
				{
					return;
				}
			}
			CheckedWatches.Add(new CheckedWatch(watch));
		}
	}
}