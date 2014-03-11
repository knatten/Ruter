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
		
		public TimePoint AddMinutes(int minutes)
		{
			var newHours = this.Hours;
			var newMinutes = this.Minutes;
			newMinutes += minutes % 60;
			newHours += minutes / 60;
			return new TimePoint(newHours, newMinutes);
		}
		
		public static TimePoint From(DateTime datetime)
		{
			return new TimePoint(datetime.Hour, datetime.Minute);
		}
	}
}