using Uno;
using Uno.Collections;
using Uno.Graphics;
using Uno.Scenes;
using Uno.Scenes.Primitives;
using Uno.Content;
using Uno.Content.Models;
using Experimental.Net.Http;
using Experimental.Data;
using Uno.UI;

namespace RuterTest
{
	public class App : Uno.Application
	{
		CurrentData data = new CurrentData();
		Scene scene = new Scene();
		
		public override void Update()
		{
			data.Update();
		}
		
		public override void Draw()
		{
			var mainPanel = new StackPanel()
			{
				Orientation = Orientation.Horizontal,
			};
			scene.Children.Add(mainPanel);
			
			foreach (var watch in data.CheckedWatches)
			{
				var subPanel = new StackPanel();
				var tmpWatch = watch.Watch;
				var tmpStop = tmpWatch.Stop;
				var stopNameBox = new TextBox()
				{
					Width = tmpStop.Name.Length * 10,
					FontSize = 15,
					Text = tmpStop.Name,
				};
				subPanel.Children.Add(stopNameBox);
				foreach (var departure in watch.Departures)
				{
					var departureBox = new TextBox()
					{
						Width = tmpStop.Name.Length * 10,
						FontSize = 15,
						Text = departure.LineName + " - " + departure.ExpectedDeparture,
					};	
					subPanel.Children.Add(departureBox);
				}
				mainPanel.Children.Add(subPanel);
			}
			
			
			var style = new DefaultStyle();
			scene.Style = style;
			scene.Draw();
		}

	}

    public partial class TestSetup// : Uno.Application
    {
		public TestSetup()
		{
			SetupTestRunner();
		}
    }
}