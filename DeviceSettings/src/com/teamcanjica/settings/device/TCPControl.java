package com.teamcanjica.settings.device;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceManager;
import android.util.AttributeSet;
import java.lang.Runtime;
import java.io.IOException;

public class TCPControl extends ListPreference implements
		OnPreferenceChangeListener {
	
	public TCPControl(Context context, AttributeSet attrs) {
		super(context, attrs);
		this.setOnPreferenceChangeListener(this);
	}

	Process process;
	String newValueString;
	static String restoreValueString;

	/**
	 * Restore TCP Control algorithm from SharedPreferences.
	 * 
	 * @param context
	 *            The context to read the SharedPreferences from
	 */
	public static void restore(Context context) {
		SharedPreferences sharedPrefs = PreferenceManager
				.getDefaultSharedPreferences(context);

		restoreValueString = sharedPrefs.getString(DeviceSettings.KEY_TCP_CONTROL, "cubic");
		String restorecommand = "sysctl -w net.ipv4.tcp_congestion_control=" + restoreValueString;
		try {
			Process restore = Runtime.getRuntime().exec(new String[]{"su","-c",restorecommand});
			restore.waitFor();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean onPreferenceChange(Preference preference, Object newValue) {
		newValueString = (String) newValue;
		String command = "sysctl -w net.ipv4.tcp_congestion_control=" + newValueString;
	try {
		    Process proc = Runtime.getRuntime().exec(new String[]{"su","-c",command});
		    proc.waitFor();
		} catch (IOException e) {
		    e.printStackTrace();
		} catch (InterruptedException e) {
		    e.printStackTrace();
		}
		return true;
	}

}
