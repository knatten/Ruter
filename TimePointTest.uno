using Uno;
using Uno.Collections;
using Uno.Graphics;
using Uno.Scenes;
using Uno.Content;
using Uno.Content.Models;
using Uno.Testing;

namespace RuterTest
{
	public class TimePointTest
	{
		[Test]
		public void OperatorLessOrEqual()
		{
			assert new TimePoint(3, 5) <= new TimePoint(3,6);
			assert new TimePoint(3, 5) <= new TimePoint(3,5);
			assert false == (new TimePoint(3, 5) <= new TimePoint(3,4));
		}
		
		[Test]
		public void OperatorGreaterOrEqual()
		{
			assert new TimePoint(3, 5) >= new TimePoint(3,4);
			assert new TimePoint(3, 5) >= new TimePoint(3,5);
			assert false == (new TimePoint(3, 5) >= new TimePoint(3,6));
		}
		
		[Test]
		public void ConvertsFromDateTime()
		{
			var expected = new TimePoint(13, 37);
			var actual = TimePoint.From(new DateTime(0, 0, 0, 13, 37, 0));
			assert expected.Equals(actual);
		}
				
		[Test]
		public void AddsMinutes()
		{
			var actual = new TimePoint(13, 27);
			var expected = new TimePoint(13, 37);
			actual = actual.AddMinutes(10);
			assert expected.Equals(actual);
		}
						
		[Test]
		public void AddsMinutesPastHour()
		{
			var actual = new TimePoint(12, 27);
			var expected = new TimePoint(13, 37);
			actual = actual.AddMinutes(70);
			assert expected.Equals(actual);
		}
	}
}