param (
    [string]$text = "This is the default text.",
    [switch]$femaleVoice,
    [int]$speed = 1
)

# Import the System.Speech assembly
Add-Type -AssemblyName System.Speech

# Create a new SpeechSynthesizer object
$synthesizer = New-Object System.Speech.Synthesis.SpeechSynthesizer

# Select the appropriate voice
if ($femaleVoice) {
    $synthesizer.SelectVoice('Microsoft Zira Desktop')
} else {
    $synthesizer.SelectVoice('Microsoft David Desktop')
}

# Set the speaking rate
$synthesizer.Rate = $speed

# Write the spoken words to the console
Write-Host $text

# Speak the text
$synthesizer.Speak($text)
