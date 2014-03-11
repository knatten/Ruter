using Uno;
using Uno.Collections;
using Uno.Graphics;
using Uno.Scenes;
using Uno.Content;
using Uno.Content.Models;

namespace RuterTest
{
	public struct Interval
	{
		public readonly TimePoint Start;
		public readonly TimePoint End;
		
		public Interval(TimePoint start, TimePoint end)
		{
			Start = start;
			End = end;
		}
				
		public bool Active {
			get {
				return ActiveAt(DateTime.Now);
			}
		}
				
		public bool ActiveAt(DateTime time)
		{
			return ActiveAt(TimePoint.From(time));
		}
				
		public bool ActiveAt(TimePoint now)
		{
			return Start <= now && End >= now;
		}
	}
	
	public struct Stop
	{
		public readonly string Name;
		public readonly int StopId;
		
		public Stop(string name, int stopId)
		{
			Name = name;
			StopId = stopId;
		}
	}

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