using Uno;
using Uno.Collections;
using Uno.Graphics;
using Uno.Scenes;
using Uno.Scenes.Primitives;
using Uno.Content;
using Uno.Content.Models;
using Experimental.Net.Http;
using Experimental.Data;

namespace RuterTest
{
	public class App : Uno.Application
	{
		CurrentData data = new CurrentData();

		public override void Update()
		{
			data.Update();
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