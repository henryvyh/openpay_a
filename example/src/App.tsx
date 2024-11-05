import { useState, useEffect } from 'react';
import { StyleSheet, View, Text, Button } from 'react-native';
import { multiply } from 'openpay_a';

export default function App() {
  const [result, setResult] = useState<string | undefined>();

  useEffect(() => {
    console.log(setResult);

    // multiply(3, 7).then(setResult);
  }, []);

  return (
    <View style={styles.container}>
      <Text>Result: {result}</Text>
      <Button
        title="Multiply"
        onPress={() => multiply(3, 7).then((e) => console.log(e))}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
