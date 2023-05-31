$apiKey = "YOUR_API_KEY"
$city = "Tel Aviv"
$apiUrl = "http://api.openweathermap.org/data/2.5/weather?q=$($city)&appid=$($apiKey)"

# Make a GET request to the API
$response = Invoke-RestMethod -Uri $apiUrl

# Extract the relevant weather information
$weatherDescription = $response.weather[0].description
$temperature = $response.main.temp
$humidity = $response.main.humidity

# Display the weather information
Write-Output "Current Weather in $($city): $($weatherDescription)"
Write-Output "Temperature: $($temperature) Kelvin"
Write-Output "Humidity: $($humidity)%"
