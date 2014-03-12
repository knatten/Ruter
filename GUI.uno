using Uno;
using Uno.Collections;
using Uno.Graphics;
using Uno.Scenes;
using Uno.Content;
using Uno.Content.Models;
using Uno.UI;

namespace RuterTest
{
	public static class GUI
	{
		public static Scene CreateScene(CurrentData data)
		{
			Scene scene = new Scene() {
				ClearColor = float4(0, 0, 0, 1),
			};
			scene.Children.Add(CreateMainPanel(data));
			var style = new DefaultStyle();
			scene.Style = style;
			return scene;
		}
		
		private static StackPanel CreateMainPanel(CurrentData data)
		{
			var mainPanel = new StackPanel()
			{
				Orientation = Orientation.Horizontal,
			};
			foreach (var watch in data.CheckedWatches)
			{
				mainPanel.Children.Add(CreateWatchPanel(watch));
			}
			return mainPanel;
		}
		
		private static StackPanel CreateWatchPanel(CheckedWatch watch)
		{
			var watchPanel = new StackPanel();
			var tmpWatch = watch.Watch;
			var tmpStop = tmpWatch.Stop;

			watchPanel.Children.Add(CreateStopNameBox(tmpStop));
			foreach (var departure in watch.Departures)
			{
				watchPanel.Children.Add(CreateDeparturePanel(departure, tmpStop));
			}
			return watchPanel;
		}
		
		private static TextBox CreateStopNameBox(Stop stop)
		{
			var stopNameBox = new TextBox()
			{
				Width = stop.Name.Length * 10,
				FontSize = 15,
				Text = stop.Name,
			};
			stopNameBox.SetValue(Element.ColorProperty, float4(0f, 0f, 0.3f, 1f));
			return stopNameBox;
		}
		
		private static DockPanel CreateDeparturePanel(Departure departure, Stop stop)
		{
			var departurePanel = new DockPanel();
			departurePanel.Children.Add(CreateDestinationBox(departure, stop));
			departurePanel.Children.Add(CreateLineNameBox(departure, stop));
			departurePanel.Children.Add(CreateDepartureTimeBox(departure));
			return departurePanel;
		}
		
		private static TextBox CreateDestinationBox(Departure departure, Stop stop)
		{
			var destinationBox = new TextBox()
			{
				Width = stop.Name.Length * 10,
				FontSize = 15,
				Text = departure.Destination,
			};
			destinationBox.SetValue(Element.ForegroundColorProperty, float4(1f, 0.7f, 0f, 1f));
			destinationBox.SetValue(DockPanel.DockProperty, Dock.Top);
			destinationBox.SetValue(Element.MarginProperty, float4(6, 6, 6, 0));
			return destinationBox;
		}
		
		private static TextBox CreateLineNameBox(Departure departure, Stop stop)
		{
			var lineNameBox = new TextBox()
			{
				Width = stop.Name.Length * 4,
				FontSize = 15,
				Text = departure.LineName,
			};
			lineNameBox.SetValue(Element.MarginProperty, float4(6, 0, 0, 0));
			return lineNameBox;
		}
		
		private static TextBox CreateDepartureTimeBox(Departure departure)
		{
			var tmpDeparture= departure.ExpectedDeparture;
			var timeBox = new TextBox()
			{
				FontSize = 15,
				Text = tmpDeparture.ToString(),
			};
			timeBox.SetValue(Element.MarginProperty, float4(0, 0, 6, 0));
			return timeBox;
		}

	}
}