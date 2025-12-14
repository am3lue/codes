#include <stdio.h>
#include <string.h>

union SensorData {
    float temperature;
    int pressure;
    char message[20];
};

int main() {
    union SensorData data;

    // Example 1: temperature packet
    data.temperature = 32.5f;
    printf("Temperature: %.2f %cC\n", data.temperature, 248);

    // Example 2: pressure packet
    data.pressure = 760;
    printf("Pressure: %d mmHg\n", data.pressure);

    // Example 3: message packet
    strcpy(data.message, "Sensor OK");
    printf("Status: %s\n", data.message);

    return 0;
}
