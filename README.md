## weather_app

A new Flutter project, using Open Weather Api to make an weather forecast app.

### Some images illustrating this app

### In use libraries:
- **http**: ^1.0.0
- **flutter_dotenv**: ^5.1.0

### Take note.
1. To build release version using API calls, need to add the declaration
```
<uses-permission android:name="android.permission.INTERNET" />
``` 
into **android/app/src/main/AndroidManifest.xml** file. Things will look like this:
```
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.weather_app">
    <uses-permission android:name="android.permission.INTERNET" />
   <application
        android:label="weather_app"
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher">
```

2. New Widgets: **ColorFiltered**

3. **dt** (DateTime) in response of Open Weather API need to be converted into normal date by using the following assign command
```
int getHourFromDt(num weatherDt) {
  final validTime = int.parse(weatherDt.toString());
  final date = DateTime.fromMillisecondsSinceEpoch(validTime * 1000);
  return date.hour;
}

int getWeekDayFromDt(num weatherDt) {
  final validTime = int.parse(weatherDt.toString());
  final date = DateTime.fromMillisecondsSinceEpoch(validTime * 1000);
  return date.weekday;
}
```

4. Sign in and sign up process to get API_KEY in Open Weather Page required for a few days.

5. Using your own API_KEY, longtitude and latitude, writing them inside **.env** file (with format the same as in **.env.example** file), then run the following command:
```
weather_app$ flutter run --release
```
6. **ENJOY**