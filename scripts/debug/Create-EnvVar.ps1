# Create an environment variable.
[Environment]::SetEnvironmentVariable("VAR_TEST", "AAAAAAAAAA", "Machine")

# Verify the existence of the environment variable.
[System.Environment]::GetEnvironmentVariable('VAR_TEST','machine')
#AAAAAAAAAA