# Development Task
This is a set of tasks to look at procedural and OOP concepts. Taking into account the similarities between most modern langauges in respect to both syntax and structure, this can be done in any langauage, or even using a sudo-code style to be language independent, but still highlight the understanding of the porblem, and a possible solution.

## 1. Functional or Procedural creation of information
Can you write a single function, or collection of functions which would print out the [Fibonacci sequence](https://en.wikipedia.org/wiki/Fibonacci_sequence) up to it's 100th number.

These can be printed in any way you want, as long as they are in a readable ordered list. For example in PHP you could replicate doing something similar to this :
```php
<?php
echo('<h2>Fibonacci Sequence</h2>' . PHP_EOL);
echo('<ul>' . PHP_EOL);
echo('<p>1 = 0</p>' . PHP_EOL);
echo('<p>2 = 1</p>' . PHP_EOL);
echo('<p>3 = 1</p>' . PHP_EOL);
echo('<p>4 = 2</p>' . PHP_EOL);
echo('<p>5 = 3</p>' . PHP_EOL);
echo('<p>6 = 5</p>' . PHP_EOL);
// ... etc etc
echo('</ul>' . PHP_EOL);
?>
```

Which would render as follows:
### Fibonacci Sequence
- 1 = 0
- 2 = 1
- 3 = 1
- 4 = 2
- 5 = 3
- 6 = 5

etc etc etc

Alternativly you could expand it further to store the values in an array and then print that as a single string like `0, 1, 1, 2, 3, 5 ...`

## 2. Classes and Structures
Think about the following JSON packet which a collection of 'places' can you create a class which can be constructed using a single one of these json objects? Note that the data source redacts properties that are empty to reduce data packet size. Eg a place may be flagged as always open, OR have the open/close properties.

The core properties should be accessible directly from anywhere it is constructed (public), however none of them should return null values. For example if the 'directions' is not present in the json then it should be set as an empty string, and not null.

```json
[
  {
    "id": 1,
    "name": "Reception",
    "categories": ["Facilities"],
    "open": "9:00am",
    "close": "5:00pm",
    "directions": "Next to the main car park as you arrive",
    "access": "There is a ramped entrance, and automatic doors to assist entry if required"
  },
  {
    "id": 5,
    "name": "Play Park",
    "categories": ["Family", "Activity"],
    "alwaysOpen": true,
    "access": "There is a wheelchair accessible swing which can be opened with a radar scheme key if required. Please ask in reception if you need any additional help.",
    "notes": "Even though the park is always unlocked and available to use, please be considerate with noise levels after 8pm and before 8am"
  },
  {
    "id": 6,
    "name": "Swimming Pool",
    "categories": ["Family", "Activity", "Entertainment"],
    "open": "10:00am",
    "close": "4:00pm",
    "directions": "The pool entrance is found in our main entertainment complex",
    "notes": "Booking is required during school holidays, from our reception"
  }
]
```

Your class should also have the following functions to access the data for rendering :
- `categoryNames` - A comma/space delimited list of categories eg 'Cat1, Cat2, Cat3'
- `isCategory` - This would receive a string and return a boolean if this place has that category or not
- `openingTimes` - Will return either the string 'Always Open' or '{Open Time} - {Close Time}'
- `details` - This should return a spannable formatted string - as this is different between langauges and for simplicity use some HTML tags with breaks etc `<b>Directions: </b>{Directions}<br><b>Accessability Information: </b>{Access}<br><b>Notes: </b>{Notes}` - This should only include data which exists for that place, eg do not include Notes if it is an empty string. There should also NOT be a trailing `<br>`

In a PHP example your class could then be used to output information blocks like this:
```php
$parsedJSONArray = []; //Array of associative arrays created from above
echo('<h1>Places</h1>');
foreach($parsedJSONArray as $placeJSON) {
  //Create a php object for each json object
  $place = new your_place_class($placeJSON);

  //Echo a block of HTML using the functions above
  echo('<div>');
  echo('<h2>' . $place->name . '</h2>');
  if ($place->isCategory('Family')) {
    echo('<img src="family-icon.png">');
  }
  echo('<p>' . $place->categoryNames() . '</p>');
  echo('<p><b>Opening Tiles: </b>' . $place->openingTimes() . '</p>');
  echo('<p>' . $place->details() . '</p>');
  echo('</div>');
}
```