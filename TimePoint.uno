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

		public static TimePoint FromUnix(int unixTimeStamp)
		{
			var newYear2014 = 1388534400;
			var sinceNewYear = unixTimeStamp-newYear2014;
			var hours = (sinceNewYear / 3600) % 24;
			var minutes = (sinceNewYear / 60) % 60;
			return new TimePoint(hours, minutes);
		}

		public static TimePoint FromUnix(int unixTimeStamp, int offset)
		{
			var utc = FromUnix(unixTimeStamp);
			var hoursOffset = offset / 100;
			var minutesOffset = offset % 100;
			return new TimePoint(utc.Hours + hoursOffset, utc.Minutes + minutesOffset);
		}
		
		public override string ToString()
		{
			return Hours.ToString() + ":" + Minutes.ToString();
		}
	}
}