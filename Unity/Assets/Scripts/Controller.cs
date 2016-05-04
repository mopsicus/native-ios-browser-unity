using UnityEngine;
using System.Collections;

public class Controller : MonoBehaviour {

	public void ShowBrowser () {
		BrowserPlugin.Launch (new RectOffset (0, 0, 0, 0));
	}

	public void LoadUrl () {
		string url = "http://mopsicus.ru";
		BrowserPlugin.LoadUrl (url);
	}

	public void HideBrowser () {
		BrowserPlugin.Close ();
	}

}
