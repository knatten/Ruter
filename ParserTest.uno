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
			assert 1394532485 == parsed[0].ExpectedDeparture;
			assert "842" == parsed[0].LineName;
			assert 1394532540 == parsed[1].ExpectedDeparture;
			assert "401" == parsed[1].LineName;
		}
	}
}