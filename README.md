# rn-airplay

Module is based on few already existing projects, it has few additional features tho and works fine with RN 0.60 and higher.

## Getting started

`$ yarn add rn-airplay`

### Mostly automatic installation

`$ cd ios && pod install`

Make sure to have Swift support on your Objective-C project.

## Usage

```javascript
import React from "react";
import { View, Text } from "react-native";
import { Airplay, AirplayButton, AirplayListener } from "rn-airplay";

class Component extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      airplayConnected: false,
      airplayAvailable: false
    };
  }

  componentDidMount() {
    this.airplayConnected = AirplayListener.addListener(
      "airplayConnected",
      devices => this.setState({ airplayConnected: devices.connected })
    );

    this.airplayAvailable = AirplayListener.addListener(
      "airplayAvailable",
      devices => this.setState({ airplayAvailable: devices.available })
    );

    Airplay.startScan();
  }

  componentWillUnmount() {
    Airplay.endScan();

    this.airplayConnected.remove();
    this.airplayAvailable.remove();
  }

  render() {
    const { airplayConnected, airplayAvailable } = this.state;

    return (
      <View>
        {airplayConnected && <Text>Airplay connected</Text>}
        {airplayAvailable && <Text>Airplay available</Text>}
        <AirplayButton />
      </View>
    );
  }
}
```
