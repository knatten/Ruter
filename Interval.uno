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
}