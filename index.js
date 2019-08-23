import React, { Component } from "react";
import {
  NativeEventEmitter,
  NativeModules,
  requireNativeComponent
} from "react-native";

const { RNAirplay } = NativeModules;
export const Airplay = RNAirplay;
export const AirplayButton = requireNativeComponent("RNAirplayButton", null);
export const AirplayListener = new NativeEventEmitter(RNAirplay);
