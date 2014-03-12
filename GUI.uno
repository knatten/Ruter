using Uno;
using Uno.Collections;
using Uno.Graphics;
using Uno.Scenes;
using Uno.Content;
using Uno.Content.Models;
using Uno.UI;
using Uno.UI.Primitives;
using Uno.Styling;
using Uno.Content.Fonts;

namespace RuterTest
{
	public class Background : Image
	{
		public static texture2D tex = import Texture2D("Assets/background.jpg");
		public Background()
		{
			Texture = tex;
		}
	}

	public class StopImage : Image
	{
		public static texture2D tex = import Texture2D("Assets/location.png");
		public StopImage()
		{
			Texture = tex;
			Width = 25;
			Height = 25;
			Color = float4(1f);
		}
	}

	public class BusImage : Image
	{
		public static texture2D tex = import Texture2D("Assets/bus.png");
		public BusImage()
		{
			Texture = tex;
			Width = 25;
			Height = 25;
			Color = float4(1f);
		}
	}

	public class ClockImage : Image
	{
		public static texture2D tex = import Texture2D("Assets/clock.png");
		public ClockImage()
		{
			Texture = tex;
			Width = 25;
			Height = 25;
			Color = float4(1f);
		}
	}

	public class DestinationBox : TextBox
	{
	}

	public class StopNameBox : TextBox
	{
	}

	public class LineNameBox : TextBox
	{
	}

	public class DepartureTimeBox : TextBox
	{
	}

	public class StopNamePanel : DockPanel
	{
	}

	public class DeparturePanel : DockPanel
	{
	}

	public class GUI
	{
		private Scene _scene;

		public void Draw()
		{
			_scene.Draw();
		}

		public void UpdateScene(CurrentData data)
		{
			_scene = new Scene() {
				ClearColor = float4(0, 0, 0, 1),
			};
			var background = new Background();
			_scene.Children.Add(background);
			_scene.Children.Add(CreateMainPanel(data));
			var style = new GangnamStyle();
			_scene.Style = style;
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

			watchPanel.Children.Add(CreateStopNamePanel(tmpStop));
			foreach (var departure in watch.Departures)
			{
				watchPanel.Children.Add(CreateDeparturePanel(departure, tmpStop));
			}
			return watchPanel;
		}

		private static DockPanel CreateStopNamePanel(Stop stop)
		{
			var stopNamePanel = new StopNamePanel()
			{
				Width = 300,
			};
			stopNamePanel.Children.Add(new StopImage());
			stopNamePanel.Children.Add(CreateStopNameBox(stop));
			return stopNamePanel;
		}

		private static TextBox CreateStopNameBox(Stop stop)
		{
			var stopNameBox = new StopNameBox()
			{
				Text = stop.Name.ToUpper(),
			};
			return stopNameBox;
		}

		private static DockPanel CreateDeparturePanel(Departure departure, Stop stop)
		{
			var departurePanel = new DeparturePanel()
			{
				Width = 300,
			};
			departurePanel.Children.Add(CreateDestinationBox(departure, stop));
			departurePanel.Children.Add(new BusImage());
			departurePanel.Children.Add(CreateLineNameBox(departure, stop));
			departurePanel.Children.Add(new ClockImage());
			departurePanel.Children.Add(CreateDepartureTimeBox(departure));
			return departurePanel;
		}

		private static TextBox CreateDestinationBox(Departure departure, Stop stop)
		{
			var destinationBox = new DestinationBox()
			{
				Text = departure.Destination.ToUpper(),
			};
			destinationBox.SetValue(DockPanel.DockProperty, Dock.Top);
			return destinationBox;
		}

		private static TextBox CreateLineNameBox(Departure departure, Stop stop)
		{
			var lineNameBox = new LineNameBox()
			{
				Width = 140,
				Text = departure.LineName,
			};
			return lineNameBox;
		}

		private static TextBox CreateDepartureTimeBox(Departure departure)
		{
			var tmpDeparture = departure.ExpectedDeparture;
			var timeBox = new DepartureTimeBox()
			{
				Text = tmpDeparture.ToString(),
			};
			return timeBox;
		}

	}
}