// client/mobile/App.tsx
import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';
import LoginScreen from './src/auth/LoginScreen';
import DiscoveryScreen from './src/discovery/DiscoveryScreen';

const Stack = createStackNavigator();

export default function App() {
  return (
    <NavigationContainer>
      <Stack.Navigator initialRouteName="Login">
        <Stack.Screen name="Login" component={LoginScreen} />
        <Stack.Screen name="Discovery" component={DiscoveryScreen} />
      </Stack.Navigator>
    </NavigationContainer>
  );
}