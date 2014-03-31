<!---
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
-->

# com.vibrationapps.vibrator

This plugin provides a way to vibrate the device.

## Installation

    cordova plugin add https://github.com/Rickgbw/cordova-plugin-vibrator

## Supported Platforms

- Android

## vibrator.vibrate

Vibrates the device for the specified amount of time.

    vibrator.vibrate(time)

- __time__: Milliseconds to vibrate the device. _(Number)_


## Example

    // Vibrate for 2.5 seconds
    vibrator.vibrate(2500);

## vibrator.cancel

Cancel actual vibration

    vibrator.cancel()