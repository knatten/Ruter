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

		public override object Evaluate(Styleable obj, object property)
		{
			var c = obj as Element;
			if (c == null) return Style.NoValue;

			if (obj is Uno.UI.Primitives.Thumb)
			{
				if (property == Element.ColorProperty) return float4(1,1,1,0.7f);
			}
			else if (obj is StopNamePanel)
			{
				if (property == Element.FontProperty) return MediumText;
				else if (property == Element.FontSizeProperty) return 25.0f;
				else if (property == Element.ForegroundColorProperty) return float4(1f);
				else if (property == Element.ColorProperty) return float4(.05f, .05f, .06f, .28f);
				else if (property == Element.MarginProperty) return float4(0, 0, 0, 0);
				else if (property == Element.PaddingProperty) return float4(10, 20, 10, 20);
			}
			else if (obj is DeparturePanel)
			{
				if (property == Element.FontProperty) return LightText;
				else if (property == Element.FontSizeProperty) return 25.0f;
				else if (property == Element.ForegroundColorProperty) return float4(1f);
				else if (property == Element.ColorProperty) return float4(.14f, .14f, .18f, .9f);
				else if (property == Element.MarginProperty) return float4(0, 0, 0, 3);
				else if (property == Element.PaddingProperty) return float4(10, 15, 10, 15);
			}
			else if (obj is DestinationBox)
			{
				if (property == Element.FontProperty) return MediumText;
				else if (property == Element.FontSizeProperty) return 25.0f;
				else if (property == Element.ForegroundColorProperty) return float4(1f, 0.7f, 0f, 1f);
				else if (property == Element.ColorProperty) return float4(0);
				else if (property == Element.MarginProperty) return float4(0);
				else if (property == Element.PaddingProperty) return float4(0);
			}
			else if (obj is TextBox)
			{
				if (property == Element.MarginProperty) return float4(0);
				else if (property == Element.PaddingProperty) return float4(0);
				else if (property == Element.ColorProperty) return float4(0);
			}
			else if (obj is BusImage || obj is ClockImage)
			{
				if (property == Element.MarginProperty) return float4(5, 5, 0, 0);
			}
			else if (obj is StopImage)
			{
				if (property == Element.MarginProperty) return float4(5, 0, 0, 0);
			}
			else if (obj is StackPanel)
			{
				if (property == Element.PaddingProperty) return float4(20, 20, 0, 0);
			}
			return Uno.Styling.Style.NoValue;
		}
	}
}