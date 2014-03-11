using Uno;
using Uno.Collections;
using Uno.Graphics;
using Uno.Scenes;
using Uno.Content;
using Uno.Content.Models;
using Uno.Testing;

namespace RuterTest
{
    public partial class TestSetup
    {
        private IRunner runner;

        private void SetupTestRunner()
        {
            var registry = new Registry();
			registry.Add(new ParserTest().TestParsing, "ParserTest.TestParsing");
			registry.Add(new TimePointTest().OperatorLessOrEqual, "TimePointTest.OperatorLessOrEqual");
			registry.Add(new TimePointTest().OperatorGreaterOrEqual, "TimePointTest.OperatorGreaterOrEqual");
			registry.Add(new TimePointTest().ConvertsFromDateTime, "TimePointTest.ConvertsFromDateTime");
			registry.Add(new TimePointTest().AddsMinutes, "TimePointTest.AddsMinutes");
			registry.Add(new TimePointTest().AddsMinutesPastHour, "TimePointTest.AddsMinutesPastHour");
			registry.Add(new IntervalTest().TooEarly_IsNotActive, "IntervalTest.TooEarly_IsNotActive");
			registry.Add(new IntervalTest().TooLate_IsNotActive, "IntervalTest.TooLate_IsNotActive");
			registry.Add(new IntervalTest().OnTime_IsActive, "IntervalTest.OnTime_IsActive");
			registry.Add(new IntervalTest().IgnoresDate, "IntervalTest.IgnoresDate");
			registry.Add(new SystemTest().GetsData, "SystemTest.GetsData");
            runner = new DefaultRunner(registry);
        }

        public /*override*/ void Update()
        {
            runner.Update();
        }
    }
}