using Uno;
using Uno.Collections;
using Uno.Graphics;
using Uno.Scenes;
using Uno.Content;
using Uno.Content.Models;

namespace RuterTest
{
	public struct Watch
	{
		public readonly Interval Interval;
		public readonly Stop Stop;
		public List<string> LineNames;

		public Watch(int fromHour, int fromMinutes, int ToHour, int toMinutes, Stop stop, List<string> lineNames)
		{
			Interval = new Interval(new TimePoint(fromHour, fromMinutes), new TimePoint(ToHour, toMinutes));
			Stop = stop;
			LineNames = lineNames;
		}

		public bool Active { get { var interval = Interval; return interval.Active;}}
	}
}