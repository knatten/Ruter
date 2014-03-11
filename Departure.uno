using Uno;
using Uno.Collections;
using Uno.Graphics;
using Uno.Scenes;
using Uno.Content;
using Uno.Content.Models;

namespace RuterTest
{
	public struct Departure
	{
		public readonly int ExpectedDeparture;
		public readonly string LineName;

		public Departure(int expectedDeparture, string lineName)
		{
			ExpectedDeparture = expectedDeparture;
			LineName = lineName;
		}
	}
}