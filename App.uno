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
		TestSetup testSetup = new TestSetup();
		bool testMode = false;

		public App()
		{
			if (testMode)
				testSetup.SetupTestRunner();
		}

		public override void Update()
		{
			if (testMode)
				testSetup.Update();
			else
				data.Update();
		}

		public override void Draw()
		{
			if (!testMode)
				GUI.CreateScene(data).Draw();
		}
	}
}