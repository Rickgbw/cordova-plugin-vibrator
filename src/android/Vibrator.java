/*
       Licensed to the Apache Software Foundation (ASF) under one
       or more contributor license agreements.  See the NOTICE file
       distributed with this work for additional information
       regarding copyright ownership.  The ASF licenses this file
       to you under the Apache License, Version 2.0 (the
       "License"); you may not use this file except in compliance
       with the License.  You may obtain a copy of the License at

         http://www.apache.org/licenses/LICENSE-2.0

       Unless required by applicable law or agreed to in writing,
       software distributed under the License is distributed on an
       "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
       KIND, either express or implied.  See the License for the
       specific language governing permissions and limitations
       under the License.
*/
package com.vibrationapps.vibrator;

import java.util.ArrayList;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;
import android.content.Context;
import android.os.Vibrator;

/**
 * This class provides access to vibration on the device.
 */
public class Vibrator extends CordovaPlugin {

    /**
     * Constructor.
     */
    public Vibrator() {
    }

    /**
     * Executes the request and returns PluginResult.
     *
     * @param action            The action to execute.
     * @param args              JSONArray of arguments for the plugin.
     * @param callbackContext   The callback context used when calling back into JavaScript.
     * @return                  True when the action was valid, false otherwise.
     */
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        Vibrator vibra = (Vibrator) cordova.getActivity().getSystemService(Context.VIBRATOR_SERVICE);

        if (action.equals("vibrate")) {
            vibra.vibrate(args.getLong(0));
        } else if(action.equals("vibrateArr")) {
            JSONArray jsonArray = (JSONArray)args.getJSONArray(0);
            long[] list = new long[jsonArray.length()];
            if (jsonArray != null) { 
               int len = jsonArray.length();
               for (int i=0;i<len;i++){ 
                 list[i] = jsonArray.getLong(i);
               } 
            }
            
            vibra.vibrate(list,args.getInt(1));
        } else if(action.equals("cancel")) {
            vibra.cancel();
        } else if(action.equals("hasVibrator")) {

        } else {
            return false;
        }

        // Only alert and confirm are async.
        callbackContext.success();
        return true;
    }
}
