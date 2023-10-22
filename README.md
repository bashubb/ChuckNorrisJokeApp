<img src="https://github.com/bashubb/ChuckNorrisJokeApp/blob/main/ChuckNorrisJokeApp/Assets.xcassets/AppIcon.appiconset/pngegg.png" width="15%"/> <h1>ChuckNorrisJokeApp</h1>

<h2>Idea</h2>

It's not a problem solving app, but a little joke can completely change even a hard day. User can display one random joke at the time, 
if it will be good, could be saved in the favorite joke list, or shared to someone by text message.

The app is quite simple. For user request it fetches a joke of choosen category about Chuck Norris from API. 
It comes in JSON format, so it is decoded and User can see it on the screen, share it with friends or save it Favorites.
I have choosen UserDefaults to store the list of favorite jokes in local memory of the device.
In this app I had a lot of fun with animations, and building my own custom elements of a UI. 
I was also my first experience with creating Unit Tests and it's my goal for the future to get full Test coverage.

<h2>Technology</h2>
<ul>
  <li>SwiftUI</li>
  <li>API</li>
  <li>MVVM</li>
  <li>Animations</li>
  <li>Unit Tests</li>
</ul>

<h2>Presentation</h2>

<h3>🚀  Intro, tab bar, first joke</h3>
<img src="https://github.com/bashubb/ChuckNorrisJokeApp/blob/main/ChuckNorrisJokeApp%20-%20Intro%2C%20TobBar%2C%20Categories.gif" width="40%" />
When app starts there is some animated Screen and then main view comes on. There is a header with the name of the app, picker to choose joke category, button "get joke" in the middle, and custom build animated Tab Bar in the bottom.

For every button action API is called and joke of selected category comes on the screen.
<br>
<h3>⏲  Tap options</h3>
<img src="https://github.com/bashubb/ChuckNorrisJokeApp/blob/main/ChuckNorrisJokeApp-%20Two%20tap%20action%2C%20Alerts.gif" width="40%" />
User can use 'Two taps' gesture on the 'joke field' and then special option sheet comes to play. It can be used for sharing and adding the joke to the favorite list. When joke has been added, confirmation alert tells about it. When joke is already in favorites there is a alert obout it too.
<br>
<h3>♡  Favorite Jokes</h3>
<img src="https://github.com/bashubb/ChuckNorrisJokeApp/blob/main/ChuckNorrisJokeApp%20-%20FavoriteJokeView.gif" width="40%" />

When tab bar's button "favorite" is choosen view switches to the List of Favorite jokes. Every row is limited to 2 lines of text. On tap pop up comes on screen with whole text and two buttons - share and delete.
Joke can also be removed by swipe action on the list


<h2>Future</h2>

<ul>
  <li>WidgetKit</li>
  <li>Available for MacOS iPadOS and WatchOS </li>
</ul>
 
