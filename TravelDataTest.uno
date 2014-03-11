using Uno;
using Uno.Collections;
using Uno.Graphics;
using Uno.Scenes;
using Uno.Content;
using Uno.Content.Models;
using Uno.Testing;

namespace RuterTest
{
	public class IntervalTest
	{
 		private Interval interval = new Interval(
 			new TimePoint(12, 0),
 			new TimePoint(13, 0),
 			);

 		[Test]
 		public void TooEarly_IsNotActive()
 		{
 			assert false == interval.ActiveAt(new DateTime(2013, 1, 1, 11, 59, 59));
 		}

 		[Test]
 		public void TooLate_IsNotActive()
 		{
 			assert false == interval.ActiveAt(new DateTime(2014, 1, 1, 11, 59, 59));
 		}

 		[Test]
 		public void OnTime_IsActive()
 		{
 			assert true == interval.ActiveAt(new DateTime(2014, 1, 1, 12, 00, 00));
 			assert true == interval.ActiveAt(new DateTime(2014, 1, 1, 12, 30, 00));
 			assert true == interval.ActiveAt(new DateTime(2014, 1, 1, 13, 00, 00));
 		}

 		[Test]
 		public void IgnoresDate()
 		{
 			assert true == interval.ActiveAt(new DateTime(2013, 1, 1, 12, 30, 00));
 			assert true == interval.ActiveAt(new DateTime(2014, 1, 1, 12, 30, 00));
 			assert true == interval.ActiveAt(new DateTime(2014, 1, 2, 12, 30, 00));
 			assert true == interval.ActiveAt(new DateTime(2014, 2, 1, 12, 30, 00));
 		}
	}
}
