using Uno;
using Uno.Collections;
using Uno.Graphics;
using Uno.Scenes;
using Uno.Content;
using Uno.Content.Models;

namespace RuterTest
{
	public struct TimePoint
	{
		public readonly int Hours;
		public readonly int Minutes;
		
		public TimePoint(int hours, int minutes)
		{
			Hours = hours;
			Minutes = minutes;
		}
		
		public static bool operator <= (TimePoint lhs, TimePoint rhs)
		{
			if (lhs.Hours < rhs.Hours)
				return true;
			if (lhs.Hours == rhs.Hours && lhs.Minutes <= rhs.Minutes)
				return true;
			return false;
		}
				
		public static bool operator >= (TimePoint lhs, TimePoint rhs)
		{
			if (lhs.Hours > rhs.Hours)
				return true;
			if (lhs.Hours == rhs.Hours && lhs.Minutes >= rhs.Minutes)
				return true;
			return false;
		}
	}
	
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
			return ActiveAt(new TimePoint(time.Hour, time.Minute));
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