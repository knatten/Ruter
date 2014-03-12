using Uno;
using Uno.Collections;
using Uno.Graphics;
using Uno.Scenes;
using Uno.Content;
using Uno.Content.Models;

namespace RuterTest
{
	public static class DataSourceFactory
	{
		public static bool Mock = false;
		public static IDataSource Create(CheckedWatch checkedWatch)
		{
			if (Mock)
				return new MockDataSource(checkedWatch);
			else
				return new RealtimeDataSource(checkedWatch);
		}
	}
}