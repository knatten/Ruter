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
			new Watch(07, 00, 18, 20, new Stop("St. Magnus Plass", 2310213), new List<string> {"435", "845", "848"}),
			new Watch(07, 00, 18, 20, new Stop("Nannestadgata", 2310305), new List<string> {"401", "842"}),
			new Watch(08, 00, 08, 45, new Stop("Mosesvingen Vest", 2310310), new List<string> {"401", "842", "3175"}),
			new Watch(08, 00, 08, 45, new Stop("Mosesvingen Øst", 2310315), new List<string> {"401", "842", "3175"}),
			new Watch(06, 40, 10, 00, new Stop("Lillestrøm [tog]", 2310300), new List<string> {"R10", "L13", "L12", "L14", "L14X"}),
			new Watch(15, 00, 17, 00, new Stop("Lillestrøm Terminal", 2310301), new List<string> {"401", "842", "845", "435", "848"}),
			new Watch(14, 00, 23, 59, new Stop("Oslo Sentralstasjon", 3010010), new List<string> {"R10", "L13", "L12", "L14", "L14X"}),
		};

		public static List<Watch> ActiveWatches {
			get
			{
				var active = new List<Watch>();
				foreach (var watch in Watches)
				{
					if (watch.Active || true)
					{
						active.Add(watch);
					}
				}
				return active;
			}
		}
	}
}