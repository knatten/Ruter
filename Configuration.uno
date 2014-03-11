using Uno;
using Uno.Collections;
using Uno.Graphics;
using Uno.Scenes;
using Uno.Content;
using Uno.Content.Models;

namespace RuterTest
{
	public static class Configuration
	{
		public static List<Watch> Watches = new List<Watch> {
			new Watch(07, 00, 22, 20, new Stop("St. Magnus Plass", 2310213), new List<string> {"828"}),
			new Watch(07, 00, 22, 20, new Stop("Nannestadgata", 2310305), new List<string> {"401", "842"}),
			new Watch(08, 00, 23, 00, new Stop("Mosesvingen Vest", 2310310), new List<string> {"401", "842", "3175"}),
			new Watch(08, 00, 23, 00, new Stop("Mosesvingen Øst", 2310315), new List<string> {"401", "842", "3175"}),
			new Watch(15, 00, 23, 30, new Stop("Lillestrøm Terminal", 2310301), new List<string> {"401", "842", "845", "435", "848"}),
		};

		public static List<Watch> ActiveWatches {
			get
			{
				var active = new List<Watch>();
				foreach (var watch in Watches)
				{
					if (watch.Active)
					{
						active.Add(watch);
					}
				}
				return active;
			}
		}
	}
}