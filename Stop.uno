using Uno;
using Uno.Collections;
using Uno.Graphics;
using Uno.Scenes;
using Uno.Content;
using Uno.Content.Models;

namespace RuterTest
{
	public struct Stop
	{
		public readonly string Name;
		public readonly int StopId;

		public Stop(string name, int stopId)
		{
			Name = name;
			StopId = stopId;
		}
	}
}