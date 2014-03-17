using Uno;
using Uno.Collections;
using Uno.Graphics;
using Uno.Scenes;
using Uno.Scenes.Primitives;
using Uno.Content;
using Uno.Content.Models;
using Experimental.Data;

namespace RuterTest
{
	public class App : Uno.Application
	{
		private readonly CurrentData _data;
		private readonly TestSetup _testSetup = new TestSetup();
		private bool _testMode = false;
		private bool _useMocks = true;
		private GUI _gui;

		public App()
		{
 			if (_testMode)
 				_testSetup.SetupTestRunner();
			DataSourceFactory.Mock = _useMocks;
			_data = new CurrentData();
			_data.Changed += HandleChanged;
			_gui = new GUI(_data);
		}

		public override void Update()
		{
			if (_testMode)
			{
				_testSetup.Update();
			}
			else
			{
				_data.Update();
			}
		}

		public override void Draw()
		{
			if (!_testMode)
			{
				_gui.Draw();
			}
		}

		public void HandleChanged()
		{
			_gui.Update();
		}
	}
}