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
		Scene scene = new Scene() {
			ClearColor = float4(0, 0, 0, 1),
		};

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
				stopNameBox.SetValue(Element.ColorProperty, float4(0f, 0f, 0.3f, 1f));
				subPanel.Children.Add(stopNameBox);
				foreach (var departure in watch.Departures)
				{
					var departurePanel = new DockPanel();
					var destinationBox = new TextBox()
					{
						Width = tmpStop.Name.Length * 10,
						FontSize = 15,
						Text = departure.Destination,
					};
					destinationBox.SetValue(Element.ForegroundColorProperty, float4(1f, 0.7f, 0f, 1f));
					destinationBox.SetValue(DockPanel.DockProperty, Dock.Top);
					destinationBox.SetValue(Element.MarginProperty, float4(6, 6, 6, 0));
					var lineNameBox = new TextBox()
					{
						Width = tmpStop.Name.Length * 4,
						FontSize = 15,
						Text = departure.LineName,
					};
					lineNameBox.SetValue(Element.MarginProperty, float4(6, 0, 0, 0));
					var tmpDeparture= departure.ExpectedDeparture;
					var timeBox = new TextBox()
					{
						FontSize = 15,
						Text = tmpDeparture.ToString(),
					};
					timeBox.SetValue(Element.MarginProperty, float4(0, 0, 6, 0));
					//timeBox.Content.SetValue(Element.HorizontalAlignmentProperty, HorizontalAlignment.Right);
					departurePanel.Children.Add(destinationBox);
					departurePanel.Children.Add(lineNameBox);
					departurePanel.Children.Add(timeBox);
					subPanel.Children.Add(departurePanel);
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