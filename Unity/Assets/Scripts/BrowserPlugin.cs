using UnityEngine;
using System.Collections;
using System.Runtime.InteropServices;

public class BrowserPlugin : MonoBehaviour {

	#if UNITY_IPHONE
	[DllImport ("__Internal")]
	private static extern void browserLaunch (int left, int right, int top, int bottom);

	[DllImport ("__Internal")]
	private static extern void browserLoadUrl (string url);

	[DllImport ("__Internal")]
	private static extern void browserClose ();
	#endif 

	// Показываем браузер
	public static void Launch (RectOffset offset) {
		#if UNITY_IPHONE
		browserLaunch (offset.left, offset.right, offset.top, offset.bottom);
		#endif
	}

	// Открыть страницу
	public static void LoadUrl (string url) {
		#if UNITY_IPHONE
		browserLoadUrl (url);
		#endif
	}

	// Убрать браузер
	public static void Close () {
		#if UNITY_IPHONE
		browserClose ();
		#endif
	}
}