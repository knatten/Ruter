using Uno;
using Uno.Collections;
using Uno.Graphics;
using Uno.Scenes;
using Uno.Content;
using Uno.Content.Models;
using Uno.Styling;
using Uno.Content.Fonts;
using Uno.UI;

namespace RuterTest
{
	public class GangnamStyle : Style
	{
		public static FontFace LightText = import FontFace("Fonts/Dosis-Light.ttf");
		public static FontFace BoldText = import FontFace("Fonts/Dosis-Bold.ttf");
		public static FontFace MediumText = import FontFace("Fonts/Dosis-Medium.ttf");

		static object White = float4(1f);
		static object Zero4 = float4(0);
		static object Yellow = float4(1f, 0.7f, 0f, 1f);

		static object StopNamePanelColor = float4(.05f, .05f, .06f, .28f);
		static object StopNamePanelPadding = float4(10, 20, 10, 20);
		static object DeparturePanelColor = float4(.14f, .14f, .18f, .9f);
		static object DeparturePanelMargin = float4(0, 0, 0, 3);
		static object DeparturePanelPadding = float4(10, 15, 10, 15);
		static object BusImageMargin = float4(5, 5, 0, 0);
		static object StopImageMargin = float4(5, 0, 0, 0);
		static object StackPanelPadding = float4(20, 20, 0, 0);

		public override object Evaluate(Styleable obj, object property)
		{
			var c = obj as Element;
			if (c == null) return Style.NoValue;

			if (obj is StopNamePanel)
			{
				if (property == Element.FontProperty) return MediumText;
				else if (property == Element.FontSizeProperty) return 25.0f;
				else if (property == Element.ForegroundColorProperty) return White;
				else if (property == Element.ColorProperty) return StopNamePanelColor;
				else if (property == Element.MarginProperty) return Zero4;
				else if (property == Element.PaddingProperty) return StopNamePanelPadding;
			}
			else if (obj is DeparturePanel)
			{
				if (property == Element.FontProperty) return LightText;
				else if (property == Element.FontSizeProperty) return 25.0f;
				else if (property == Element.ForegroundColorProperty) return White;
				else if (property == Element.ColorProperty) return DeparturePanelColor;
				else if (property == Element.MarginProperty) return DeparturePanelMargin;
				else if (property == Element.PaddingProperty) return DeparturePanelPadding;
			}
			else if (obj is DestinationBox)
			{
				if (property == Element.FontProperty) return MediumText;
				else if (property == Element.FontSizeProperty) return 25.0f;
				else if (property == Element.ForegroundColorProperty) return Yellow;
				else if (property == Element.ColorProperty) return Zero4;
				else if (property == Element.MarginProperty) return Zero4;
				else if (property == Element.PaddingProperty) return Zero4;
			}
			else if (obj is TextBox)
			{
				if (property == Element.MarginProperty) return Zero4;
				else if (property == Element.PaddingProperty) return Zero4;
				else if (property == Element.ColorProperty) return Zero4;
			}
			else if (obj is BusImage || obj is ClockImage)
			{
				if (property == Element.MarginProperty) return BusImageMargin;
			}
			else if (obj is StopImage)
			{
				if (property == Element.MarginProperty) return StopImageMargin;
			}
			else if (obj is StackPanel)
			{
				if (property == Element.PaddingProperty) return StackPanelPadding;
			}
			return Uno.Styling.Style.NoValue;
		}
	}
}