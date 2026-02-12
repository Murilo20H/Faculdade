import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View, Image, Pressable } from 'react-native';
import Imagem from './assets/image.png';
import { useState } from 'react';

export default function App() {
  const [curtido, setCurtido] = useState(false);

  return (
    <View style={styles.container}>
      <Image source={Imagem} style={{width: 100, height: 100}} />
      <Pressable onPress={() => setCurtido(!curtido)}>
        <Text style={styles.btn}>{curtido ? "Curtido" : "Curtir"}</Text>
      </Pressable>
      <Text style={{ color: "red" }}>Olá mundo!</Text>
      <StatusBar style="auto" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
  btn: {
    paddingHorizontal: 10,
    paddingVertical: 5,
    justifyContent: "center",
    alignContent: "center",
    backgroundColor: "blue",
    color: "white"
  }
});
