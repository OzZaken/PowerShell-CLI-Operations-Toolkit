try {
    $data = Get-CimInstance -ClassName MSAcpi_ThermalZoneTemperature -Namespace "root/wmi"
    $temp = @()
    $temp = $data.CurrentTemperature
    $sensor = 1
    
    foreach ($line in $temp) {
        $k = $line / 10
        $kelvin = [math]::round($k, 2)
        $c = $kelvin - 273.15
        $celsius = [math]::round($c, 2)
        $f = (9/5) * $celsius + 32
        $fahrenheit = [math]::round($f, 2)
        
        Write-Output "Sensor $sensor, Celsius $celsius, Fahrenheit $fahrenheit, Kelvin $kelvin"
        $sensor++
    }
}
catch {
    Write-Output "An error occurred: $_"
}
