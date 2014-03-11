using Uno;
using Uno.Collections;
using Uno.Graphics;
using Uno.Scenes;
using Uno.Content;
using Uno.Content.Models;
using Uno.Testing;

namespace RuterTest
{
	public class ParserTest
	{
		[Test]
		public void TestParsing()
		{
			var parsed = Parser.Parse(TestData.MosesvingenFiveDepartures);
			assert 5 == parsed.Count;
			var expectedDeparture1 = new TimePoint(11, 08);
			assert expectedDeparture1.Equals(parsed[0].ExpectedDeparture);
			assert "842" == parsed[0].LineName;
			var expectedDeparture2 = new TimePoint(11, 09);
			assert "401" == parsed[1].LineName;
			assert expectedDeparture2.Equals(parsed[1].ExpectedDeparture);
		}
	}
}