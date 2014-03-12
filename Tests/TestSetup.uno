using Uno;
using Uno.Collections;
using Uno.Graphics;
using Uno.Scenes;
using Uno.Content;
using Uno.Content.Models;
using Uno.Testing;

namespace RuterTest
{
    public class TestSetup
    {
        private IRunner runner;

        public void SetupTestRunner()
        {
            var registry = new Registry();
			registry.Add(new ParserTest().TestParsing, "ParserTest.TestParsing");
			registry.Add(new TimePointTest().OperatorLessOrEqual, "TimePointTest.OperatorLessOrEqual");
			registry.Add(new TimePointTest().OperatorGreaterOrEqual, "TimePointTest.OperatorGreaterOrEqual");
			registry.Add(new TimePointTest().ConvertsFromDateTime, "TimePointTest.ConvertsFromDateTime");
			registry.Add(new TimePointTest().AddsMinutes, "TimePointTest.AddsMinutes");
			registry.Add(new TimePointTest().AddsMinutesPastHour, "TimePointTest.AddsMinutesPastHour");
			registry.Add(new TimePointTest().ConvertsFromUnix, "TimePointTest.ConvertsFromUnix");
			registry.Add(new TimePointTest().ConvertsFromUnixWithOffset, "TimePointTest.ConvertsFromUnixWithOffset");
			registry.Add(new TimePointTest().ToString, "TimePointTest.ToString");
			registry.Add(new IntervalTest().TooEarly_IsNotActive, "IntervalTest.TooEarly_IsNotActive");
			registry.Add(new IntervalTest().TooLate_IsNotActive, "IntervalTest.TooLate_IsNotActive");
			registry.Add(new IntervalTest().OnTime_IsActive, "IntervalTest.OnTime_IsActive");
			registry.Add(new IntervalTest().IgnoresDate, "IntervalTest.IgnoresDate");
            runner = new DefaultRunner(registry);
        }

        public void Update()
        {
            runner.Update();
        }
    }
}