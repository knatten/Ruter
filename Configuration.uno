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
			new Watch(07, 00, 08, 20, new Stop("St. Magnus Plass", 2310213), new List<string> {"828"}),
			new Watch(07, 00, 08, 20, new Stop("Nannestadgata", 2310305), new List<string> {"401", "842"}),
			new Watch(08, 00, 23, 00, new Stop("Mosesvingen Vest", 2310310), new List<string> {"401", "842", "3175"}),
		};
		
		public static List<Watch> ActiveWatches {
			get
			{
				return Watches; //TODO filter by Active
			}
		}
	}
}